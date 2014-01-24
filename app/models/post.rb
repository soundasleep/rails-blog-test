class Post < ActiveRecord::Base

	# added manually
	has_many :comments, dependent: :destroy
	
	# constraints? or just validation?
	validates :title, 
		presence: true,
		length: { minimum: 3 }

	validates :text,
		presence: true,
		length: { minimum: 5 }

end
