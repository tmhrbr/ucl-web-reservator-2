class CreateStudentAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :student_assignments do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
