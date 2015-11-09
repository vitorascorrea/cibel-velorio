class Cemiterio < ActiveRecord::Base
  has_one :velorio
  belongs_to :velorio
end
