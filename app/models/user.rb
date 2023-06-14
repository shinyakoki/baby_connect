class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # パスワードのバリデーションを半角英数字の混合に指定
  validates :password, format: {
    with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i,
    message: 'は英数字の混合である必要があります'
  }

  # 1つのuser(親)が複数のbabyを持つことができる。
  has_many :babies, dependent: :destroy

  # ゲストログイン機能
   def self.guest
     find_or_create_by!(email: 'guest@example.com') do |user|
      # 8文字の英数字のランダムパスワードを指定
       user.password = SecureRandom.alphanumeric(8)
       user.name = "guest_user"
     end
   end
end
