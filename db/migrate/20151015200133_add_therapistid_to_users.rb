class AddTherapistidToUsers < ActiveRecord::Migration
  def change
    add_column :users, :therapist, :reference
  end
end
