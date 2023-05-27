class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

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
