class CreateArticlesContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :articles_contacts do |t|
      t.references :article, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
