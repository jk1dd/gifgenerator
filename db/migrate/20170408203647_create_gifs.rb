class CreateGifs < ActiveRecord::Migration[5.0]
  def change
    create_table :gifs do |t|
      t.string :image_url
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
