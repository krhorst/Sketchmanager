class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.integer :level
      t.references :user
      t.references :group

      t.timestamps
    end
  end

  def self.down
    drop_table :memberships
  end
end
