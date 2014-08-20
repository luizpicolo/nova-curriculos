class User < ActiveRecord::Base

  # after_create :send_welcome_email

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :candidate, :dependent => :destroy
  has_one :company, :dependent => :destroy

  def is_company?
    self.is_candidate ? false : true
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
