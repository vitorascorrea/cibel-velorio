class Atendente < ActiveRecord::Base
  belongs_to :agencia
  belongs_to :funcionario
end
