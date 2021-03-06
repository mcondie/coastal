class Photo < ActiveRecord::Base
	belongs_to :category
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", large: "1920x1080#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :notes

  # -- Relationships --------------------------------------------------------


  # -- Callbacks ------------------------------------------------------------


  # -- Validations ----------------------------------------------------------


  # -- Scopes ---------------------------------------------------------------


  # -- Class Methods --------------------------------------------------------


  # -- Instance Methods -----------------------------------------------------
  attr_accessor :noteField

end