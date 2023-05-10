class Baby < ApplicationRecord

has_many :shares
has_many :parents, through: :shares

end
