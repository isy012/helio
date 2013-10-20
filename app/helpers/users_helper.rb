module UsersHelper

	#Return the gravatar so that people are not blank
	def gravatar_for(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		gravatar_url = "http://www.gravatar.com/avatar/#{gravatar_id}"
		image_tag(gravatar_url, :alt => user.name,
								:class => "gravatar img-circle")
	end

end
