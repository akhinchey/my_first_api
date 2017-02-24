class CreateH1Tags < ActiveRecord::Migration[5.0]
  def change
    create_table :h1_tags do |t|
      t.references :url, index: true
      t.string :content, null: false
      t.timestamps
    end
  end
end
