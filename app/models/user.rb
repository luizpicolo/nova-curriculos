class User < ActiveRecord::Base
  extend FriendlyId

  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_one :candidate, :dependent => :destroy
  has_one :company, :dependent => :destroy

  def is_company?
    self.is_candidate ? false : true
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
          name:auth.extra.raw_info.name,
          provider:auth.provider,
          uid:auth.uid,
          email:auth.info.email,
          is_candidate: true,
          password:Devise.friendly_token[0,20],
        )
      end
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end
end
