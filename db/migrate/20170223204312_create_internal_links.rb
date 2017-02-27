class CreateInternalLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :internal_links do |t|
      t.references :url, index: true
      t.string :name, null: false
      t.string :content, null: false
      t.timestamps
    end
  end
end
