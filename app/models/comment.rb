class Comment
  include ActiveModel::Model

  attr_accessor :email, :subject, :message

  validates :email, :subject, :message, presence: true
end