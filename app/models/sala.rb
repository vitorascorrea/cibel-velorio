class Sala < ActiveRecord::Base
  belongs_to :velorio
  has_many :reservas
end
