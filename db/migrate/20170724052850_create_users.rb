class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end
end

# Add group reference in users
# rails generate migration AddGroupRefToUsers group:references