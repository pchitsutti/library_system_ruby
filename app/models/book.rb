class Book < ActiveRecord::Base
  has_attached_file :cover, styles: { 
    medium: "300x300>", thumb: "100x100>" 
  }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/
  
	belongs_to :user
	has_many :book_histories
  validates :title,
            :presence => true
  validates :isbn,
            :presence => true
  validates :description,
            :presence => true
  validates :isbn,
            :presence => true,
            :uniqueness => true

  def cover_url
    self.logo.expiring_url(3600, :medium)
  end

end
