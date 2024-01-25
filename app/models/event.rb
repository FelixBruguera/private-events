class Event < ApplicationRecord
    scope :past, -> { where(event.date < Date.today.to_s)}
    scope :upcoming, -> { where(date > Date.today.to_s)}
    belongs_to :user, foreign_key: :creator, class_name: 'User'
    has_many :event_attendances, foreign_key: :attended_event
    has_many :users, through: :event_attendances, foreign_key: :attended_event, class_name: 'User'
end
