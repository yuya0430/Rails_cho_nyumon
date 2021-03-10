class CreateBlogconfigs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogconfigs do |t|
      t.text :title
      t.text :subtitle
      t.text :stylename

      t.timestamps
    end
  end
end
