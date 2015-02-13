class Cocktail < ActiveRecord::Base
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # accepts_nested_attributes_for :doses,
  #   :allow_destroy => true,
  #   :reject_if     => :all_blank

  validates :name, presence: true, uniqueness: true


  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" },
    storage: :ftp,
    path: "www/:attachment/:id/:style/:filename",
    url: "http://www.lowclass.net/:attachment/:id/:style/:filename",
    ftp_servers: [
        host:      ENV["FTP_HOST"],
        user:      ENV["FTP_USER"],
        password:  ENV["FTP_PASSWORD"],
        passive: true
    ],
    ftp_connect_timeout: 5,
    ftp_ignore_failing_connections: true

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
