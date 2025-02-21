class ChangeStatusToIntegerInJobApplications < ActiveRecord::Migration[8.0]
  def change
    change_column :job_applications, :status, :integer, default: 0, null: false
  end
end
