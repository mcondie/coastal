class CommentMailer < ApplicationMailer
	default from: 'comments@coastal.branch13.com',
					to: 'matthew.condie@gmail.com'

	def comment_email(email, subject, message)
		@message = message
		@email = email
		mail(to: 'matthew.condie@gmail.com', from: 'comments@coastal.branch13.com', cc: email, subject: subject)
	end
end
