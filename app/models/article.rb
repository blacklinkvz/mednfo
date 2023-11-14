class Article < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  has_and_belongs_to_many :diseases
  has_and_belongs_to_many :medicaments
end
