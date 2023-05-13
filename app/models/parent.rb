class Parent < ApplicationRecord

# userモデルを親として扱うのでparentモデルは不要になった
# has_many :shares
# has_many :babies, through: :shares


end
