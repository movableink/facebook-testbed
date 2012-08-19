class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :token

  has_many :purchases, :primary_key => :uid
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

  def friends
    @graph = Koala::Facebook::API.new(token)

    @graph.get_connections("me", "friends")
  end

  def friend_ids
    friends.map{|f| f['id'] }
  end

  def friends_who_purchased(product)
    User.joins(:purchases).where(:purchases => { :product_id => product.id, :user_id => friend_ids})
  end

end
