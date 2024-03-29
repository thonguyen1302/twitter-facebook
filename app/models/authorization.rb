class Authorization < ActiveRecord::Base
	belongs_to :user
	validates :provider, :uid, :presence => true
	attr_accessible :provider, :uid, :user_id

	def self.find_or_create(auth_hash)
	  unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
	    user = User.create :email => auth_hash["user_info"]["email"], :email => auth_hash["user_info"]["email"]
	    auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
	  end
	  auth
	end

end
