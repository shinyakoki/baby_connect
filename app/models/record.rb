class Record < ApplicationRecord
  belongs_to :baby
  # enum の定義
  enum item: { meal: 1, sleeping: 2, milk: 3, breast_milk: 4 }
  enum unit: { ml: 1 }

end
