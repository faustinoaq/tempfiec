class TemperaturaController < ApplicationController
  getter temperatura = Temperatura.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_temperatura }
  end

  def index
    time = params[:time]?
    time = 1 unless time
    temperaturas = Temperatura.all("WHERE (MOD(id, ?) = 0) ORDER BY created_at DESC LIMIT 10", [time])
    respond_with do
      html render "index.slang"
      json temperaturas.to_json
    end
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def create
    temperatura = Temperatura.new temperatura_params.validate!
    if temperatura.save
      redirect_to action: :index, flash: {"success" => "Created temperatura successfully."}
    else
      flash["danger"] = "Could not create Temperatura!"
      render "new.slang"
    end
  end

  def update
    temperatura.set_attributes temperatura_params.validate!
    if temperatura.save
      redirect_to action: :index, flash: {"success" => "Updated temperatura successfully."}
    else
      flash["danger"] = "Could not update Temperatura!"
      render "edit.slang"
    end
  end

  def destroy
    temperatura.destroy
    redirect_to action: :index, flash: {"success" => "Deleted temperatura successfully."}
  end

  private def temperatura_params
    params.validation do
      required :grados { |f| !f.nil? }
      required :frecuencia { |f| !f.nil? }
    end
  end

  private def set_temperatura
    @temperatura = Temperatura.find! params[:id]
  end
end
