class AddTherapistidToUser < ActiveRecord::Migration
  def change
    add_reference :users, :therapist, index: true, foreign_key: true
  end
end
