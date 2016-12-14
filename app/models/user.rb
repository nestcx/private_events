class User < ApplicationRecord
  has_many :events, :foreign_key => :creator_id

  has_many :event_attendees
  has_many :attended_events, :through => :event_attendees, foreign_key: :user_id

  before_save { self.email = email.downcase }
  before_create :create_remember_token


  def upcoming_events
    self.attended_events.where("date > ?", Date.today)
  end

  def previous_events
    self.attended_events.where("date < ?", Date.today)
  end


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end