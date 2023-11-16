class Article < ApplicationRecord
  belongs_to :user
  belongs_to :travel
  has_many :diseases, through: :articles_diseases
  has_many :medicaments, through: :articles_medicaments
  has_many :contacts, through: :articles_contacts
end
