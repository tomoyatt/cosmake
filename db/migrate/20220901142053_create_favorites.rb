class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      
      t.integer :article_id, null: false

      t.timestamps
    end
  end
end
