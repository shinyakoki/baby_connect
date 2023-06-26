class Record < ApplicationRecord

  # 各recordは1つのbaby(赤ちゃんに)所属している。
  belongs_to :baby

  validates :amount, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 500 }

  # enum の定義
  enum item: { meal: 1, sleeping: 2, milk: 3, breast_milk: 4 }
  enum unit: { ml: 1 }
end
