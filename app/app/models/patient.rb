class Patient < ApplicationRecord
  has_many :appointments
  has_many :Physicians, through: :appointments, source: :Physician 
end
