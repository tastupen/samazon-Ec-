class CreateShoppingCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_carts do |t|
      t.boolean :buy_flag, null: false, default: false #カートが注文確定済みか否かを判別できるようにするため
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
