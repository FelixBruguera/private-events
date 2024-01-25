class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, foreign_key: :creator, class_name: 'Event'
  has_many :event_attendances, foreign_key: :attendee
  has_many :events, through: :event_attendances, foreign_key: :attendee, class_name: 'Event'
end
