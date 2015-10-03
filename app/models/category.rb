class Category < ActiveRecord::Base
	has_many :children, class_name: "Category", foreign_key: "parent_id"
  has_many :photos
 
  belongs_to :parent, class_name: "Category"

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # -- Relationships --------------------------------------------------------


  # -- Callbacks ------------------------------------------------------------


  # -- Validations ----------------------------------------------------------


  # -- Scopes ---------------------------------------------------------------


  # -- Class Methods --------------------------------------------------------


  # -- Instance Methods -----------------------------------------------------


end