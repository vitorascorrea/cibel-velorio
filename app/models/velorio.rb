class Velorio < ActiveRecord::Base
  has_one :cemiterio
  belongs_to :cemiterio
  has_many :salas
  has_many :veloristas
  has_many :reservas
end
