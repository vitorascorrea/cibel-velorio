class Reserva < ActiveRecord::Base
  belongs_to :atendente
  belongs_to :sala
  belongs_to :cemiterio
  belongs_to :velorio
end
