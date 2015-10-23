class AddIsTherapistToUsers < ActiveRecord::Migration
  def change
    add_column :users, :is_therapist, :boolean
  end
end
