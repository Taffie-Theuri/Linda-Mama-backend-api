class Doctor < ApplicationRecord

  has_many :appointments, dependent: :nullify
  has_many :patients, through: :appointments

  
end
