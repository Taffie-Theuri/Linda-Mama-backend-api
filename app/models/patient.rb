class Patient < ApplicationRecord

  has_many :appointments, dependent: :nullify
  has_many :doctors, through: :appointments
  has_many :results

  

end
