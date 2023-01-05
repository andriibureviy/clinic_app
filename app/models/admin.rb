class Admin < ApplicationRecord
  devise :phone_authenticatable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
