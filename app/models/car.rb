# == Schema Information
#
# Table name: cars
#
#  id                :bigint           not null, primary key
#  client_first_name :string
#  client_last_name  :string
#  email             :string
#  last_serviced_at  :date
#  name              :string
#  plate_number      :string
#  telephone_number  :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
# Indexes
#
#  index_cars_on_last_serviced_at  (last_serviced_at)
#  index_cars_on_plate_number      (plate_number)
#
class Car < ApplicationRecord
  before_validation {self.email = email.downcase; self.plate_number = plate_number.upcase}
  validates :client_first_name,
  :client_last_name,
  :name,
  :plate_number, :telephone_number,
  presence: true

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, if: -> (car) { car.email.present? } }
  validates :plate_number, uniqueness: true

  def self.search(search)
    if search
      where('plate_number ILIKE ?', "%#{search}%").or(
        where('(client_first_name || \' \' || client_last_name) ILIKE ?', "%#{search}%")
      ).or(
        where('email ILIKE ?', "%#{search}%")
      ).or(
        where('telephone_number ILIKE ?', "%#{search}%")
      ).or(
        where('name ILIKE ?', "%#{search}%")
      )
    else
      all
    end
  end

  def client_name
    client_first_name + " " + client_last_name
  end
end
