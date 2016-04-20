class CommentMailer < ApplicationMailer
	default from: 'comments@coastal.branch13.com',
					to: 'corycoastal@aol.com'

	def comment_email(email, subject, message)
		@message = message
		@email = email
		mail(to: 'corycoastal@aol.com', from: 'comments@coastal.branch13.com', cc: email, subject: subject)
	end
end
