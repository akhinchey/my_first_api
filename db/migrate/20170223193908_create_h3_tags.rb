class CreateH3Tags < ActiveRecord::Migration[5.0]
  def change
    create_table :h3_tags do |t|
      t.references :url, index: true
      t.string :content, null: false
      t.timestamps
    end
  end
end
