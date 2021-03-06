class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, :use => :slugged

  attr_accessible :username, :password, :account_type, :email, :photo_url
  attr_reader :password

  has_many :followings, :dependent => :destroy
  has_many :following_pets, :through => :followings, :source => :pet
  has_many(
    :authored_posts,
    :class_name => "Post",
    :foreign_key => :user_id,
    :primary_key => :id
  )
  has_many :postshares, :as => :postable, :dependent => :destroy
  has_many :posts, :through => :postshares, :source => :post
  has_many :publicshares, :as => :publicable, :dependent => :destroy
  has_many :public_posts, :through => :publicshares, :source => :post
  has_many :testimonials
  has_many :photos, :through => :posts, :source => :photos
  has_many :public_photos, :through => :public_posts, :source => :photos
  has_many(
    :posted_photos,
    :class_name => "Photo"
  )
  has_many :ownerships
  has_many :owned_pets, :through => :ownerships, :source => :pet

  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  validates :username, :presence => true
  validates_inclusion_of :account_type, :in => ["user" , "admin"]

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)

    return nil if user.nil?

    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end

  def as_json(options = {})
    super(options.merge(:only => [:id, :username, :photo_url]))
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
