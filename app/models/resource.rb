# == Schema Information
#
# Table name: resources
#
#  id           :integer          not null, primary key
#  name         :string
#  address      :string
#  notes        :text
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  latitude     :float
#  longitude    :float
#  slug         :string
#  phone_number :string
#  website      :string
#



class Resource < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :comments
	validates :name, :address, :phone_number, presence: true

	extend FriendlyId
  	friendly_id :name, use: :slugged

  	geocoded_by :address
  	after_validation :geocode
  	normalize_attribute :name, :address, :notes, :phone_number, :with => :squish
end
