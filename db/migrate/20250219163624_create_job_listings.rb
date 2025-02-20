class CreateJobListings < ActiveRecord::Migration[8.0]
  def change
    create_table :job_listings do |t|
      t.string :title
      t.string :company_name
      t.string :location
      t.boolean :remote
      t.string :url

      t.timestamps
    end
  end
end
