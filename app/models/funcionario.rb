class Funcionario < ActiveRecord::Base
  has_one :atendente
  has_one :velorista

  has_secure_password
  
  validates :nome, presence: true
  validates :rf, presence: true
  validates :password, presence: true, allow_nil: true
end
