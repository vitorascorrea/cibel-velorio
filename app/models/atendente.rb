class Atendente < ActiveRecord::Base
  belongs_to :agencia
  belongs_to :funcionario
  
  validates :funcionario_id, presence: true
end