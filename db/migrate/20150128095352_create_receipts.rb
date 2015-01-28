class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :title
      t.string :content
      t.string :url
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end
