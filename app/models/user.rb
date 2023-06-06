class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validates :email, presence: true
  # validates :password, presence: true, length: { minimum: 8, maximum: 15 }
  # validates :password_confirmation, presence: true, length: { minimum: 8, maximum: 15 }

  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
    message: 'は英数字の混合である必要があります'
  }

  # アソシエーションの記述
  # 1つのuser(親)が複数のbabyを持つことができる。
  has_many :babies, dependent: :destroy
  # ここまで

  # ゲストログイン機能
   def self.guest
     find_or_create_by!(email: 'guest@example.com') do |user|
       user.password = SecureRandom.urlsafe_base64
       user.name = "guest_user"
      # user.date_of_birth = Date.new(2000, 1, 1)
     end
   end
  # ここまで

end
