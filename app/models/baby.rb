class Baby < ApplicationRecord

# 各babyは1つのuser(親に)所属している。
belongs_to :user

# 1つのbaby(赤ちゃん)が複数のrecordsを持つことができる
has_many :records

validates :nickname, presence: true
validates :sex, inclusion: { in: %w[boy girl] }
validates :date_of_birth, presence: true

# enum の定義
enum sex: { boy: 0, girl: 1 }
end
