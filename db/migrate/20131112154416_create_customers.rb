class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :addy1
      t.string :addy2
      t.string :city
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
