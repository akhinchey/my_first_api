class CreateHOneTags < ActiveRecord::Migration[5.0]
  def change
    create_table :h_one_tags do |t|
      t.string :content, null: false
      t.references :url, index: true
      t.timestamps
    end
  end
end
