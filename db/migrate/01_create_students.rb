class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :twitter
      t.string :linkedin
      t.string :github
      t.string :quote
      t.string :bio
      t.string :work
      t.string :work_title
      t.string :education
      t.string :profile_image
      t.string :background_image
    end
  end
end

