class Record < ApplicationRecord

  # enum の定義
  enum item: { milk: 1, breast_milk: 2, meal: 3, sleeping: 4 }
  enum unit: { ml: 1 }

end
