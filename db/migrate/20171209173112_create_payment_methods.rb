class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.string :email
      t.string :payment_token
      t.belongs_to :user , class: "User"
      t.timestamps null: false
    end
  end
end
