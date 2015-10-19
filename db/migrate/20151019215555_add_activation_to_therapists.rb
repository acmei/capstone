class AddActivationToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :activation_digest, :string
    add_column :therapists, :activated, :boolean
    add_column :therapists, :activated_at, :datetime
  end
end
