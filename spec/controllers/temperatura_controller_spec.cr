require "./spec_helper"

def temperatura_hash
  {"grados" => "1.00", "frecuencia" => "1"}
end

def temperatura_params
  params = [] of String
  params << "grados=#{temperatura_hash["grados"]}"
  params << "frecuencia=#{temperatura_hash["frecuencia"]}"
  params.join("&")
end

def create_temperatura
  model = Temperatura.new(temperatura_hash)
  model.save
  model
end

class TemperaturaControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe TemperaturaControllerTest do
  subject = TemperaturaControllerTest.new

  it "renders temperatura index template" do
    Temperatura.clear
    response = subject.get "/temperaturas"

    response.status_code.should eq(200)
    response.body.should contain("temperaturas")
  end

  it "renders temperatura show template" do
    Temperatura.clear
    model = create_temperatura
    location = "/temperaturas/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Temperatura")
  end

  it "renders temperatura new template" do
    Temperatura.clear
    location = "/temperaturas/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Temperatura")
  end

  it "renders temperatura edit template" do
    Temperatura.clear
    model = create_temperatura
    location = "/temperaturas/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Temperatura")
  end

  it "creates a temperatura" do
    Temperatura.clear
    response = subject.post "/temperaturas", body: temperatura_params

    response.headers["Location"].should eq "/temperaturas"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a temperatura" do
    Temperatura.clear
    model = create_temperatura
    response = subject.patch "/temperaturas/#{model.id}", body: temperatura_params

    response.headers["Location"].should eq "/temperaturas"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a temperatura" do
    Temperatura.clear
    model = create_temperatura
    response = subject.delete "/temperaturas/#{model.id}"

    response.headers["Location"].should eq "/temperaturas"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
