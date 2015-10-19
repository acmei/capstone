class AddRememberDigestToTherapists < ActiveRecord::Migration
  def change
    add_column :therapists, :remember_digest, :string
  end
end
