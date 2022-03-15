class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable, :omniauthable

         has_one :profile, dependent: :destroy   

         accepts_nested_attributes_for :profile, allow_destroy: true

         def self.form_omniauth(auth)
          where(provider: auth.provider, uid:auth.uid).first_or_create do |user|
          user.provider = auth.provider
          user.name = auth.info.name
          user.uid = auth.uid
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
        end
      end
end
