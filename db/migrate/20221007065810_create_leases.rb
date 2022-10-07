class CreateLeases < ActiveRecord::Migration[6.1]
  def change
    create_table :leases do |t|
      t.integer :apartment_id
      t.integer :tenant_id
      t.integer :rent

      t.timestamps
    end
  end
end
