class Temperatura < Granite::Base
  include JSON::Serializable

  adapter pg
  table_name temperaturas

  primary id : Int64
  field grados : Float64
  field frecuencia : Int32
  timestamps
end
