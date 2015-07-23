class User < ActiveRecord::Base
	acts_as_messageable  
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable# , :confirmable



    def name
    	return self.first_name + " " + self.last_name
    end
    def mailboxer_email(object)
		return self.email
	end
end
