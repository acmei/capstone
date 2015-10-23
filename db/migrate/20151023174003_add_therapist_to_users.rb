class AddTherapistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :therapist, :boolean
  end
end
