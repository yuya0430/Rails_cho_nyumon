class CreateBoardComments < ActiveRecord::Migration[6.0]
  def change
    create_table :board_comments do |t|
      t.text :content
      t.integer :board_user_id

      t.timestamps
    end
  end
end
