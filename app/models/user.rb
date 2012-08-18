class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :token

  has_many :purchases
  has_many :products, :through => :purchases

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']

      if auth['credentials']
        user.token = auth['credentials']['token']
      end

      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

end
