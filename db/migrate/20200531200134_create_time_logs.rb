class CreateTimeLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :time_logs do |t|
      t.string :time_type
      t.datetime :start_time
      t.datetime :finish_time
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
