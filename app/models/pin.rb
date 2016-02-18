class Pin < ActiveRecord::Base  
  belongs_to :album
  has_one :user, through: :album
  
  has_and_belongs_to_many :people, class_name: 'User'
  
  serialize :text_marks, Array

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>", small: "70x70>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  validates :image, presence: true

end
