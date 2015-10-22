class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.datetime :date
      t.integer :num
      t.string :text
      t.boolean :bool
      t.references :question
      t.references :user

      t.timestamps null: false
    end
  end
end
