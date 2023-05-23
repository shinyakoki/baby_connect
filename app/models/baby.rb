class Baby < ApplicationRecord

# アソシエーションの記述
# 各babyは1つのuser(親に)所属している。
 belongs_to :user
# ここまで

has_many :records
# enum の定義
enum sex: { boy: 0, girl: 1 }

end
