class Disease < ApplicationRecord
    has_many :articles, through: :articles_diseases
end
