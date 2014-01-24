class Post < ActiveRecord::Base
	
	# constraints? or just validation?
	validates :title, 
		presence: true,
		length: { minimum: 3 }

	validates :text,
		presence: true,
		length: { minimum: 5 }

end
