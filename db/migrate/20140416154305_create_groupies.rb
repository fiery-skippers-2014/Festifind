class CreateGroupies < ActiveRecord::Migration
  def change
    create_table :groupies do |t|
      t.belongs_to :band
      t.belongs_to :user

      t.timestamps
    end
  end
end
