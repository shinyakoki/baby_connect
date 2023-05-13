class Baby < ApplicationRecord

# アソシエーションの記述
# 各babyは1つのuser(親に)所属している。
belongs_to :user
# ここまで
end
