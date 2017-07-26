class CreateVulgarities < ActiveRecord::Migration[5.1]
  def change
    create_table :vulgarities do |t|
    	t.references :user, index: true
    	t.integer :count, default: 0
    	t.float :amount, default: 0

      t.timestamps
    end
  end
end
