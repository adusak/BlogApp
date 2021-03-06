class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "80x80#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: %r{\Aimage\/.*\Z}

  validates_presence_of :avatar

  has_many :posts, dependent: :destroy
end
