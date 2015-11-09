class Funcionario < ActiveRecord::Base
  has_one :atendente
  has_one :velorista

  has_secure_password
end
