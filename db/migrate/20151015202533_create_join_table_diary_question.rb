class CreateJoinTableDiaryQuestion < ActiveRecord::Migration
  def change
    create_join_table :diaries, :questions do |t|
      t.index [:diary_id, :question_id]
      t.index [:question_id, :diary_id]
    end
  end
end
