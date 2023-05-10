class Parent < ApplicationRecord

has_many :shares
has_many :babies, through: :shares


end
