class CreateUserLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_logs do |t|
      t.text :comment
      t.string :logType
      t.datetime :startTime
      t.datetime :finishTime
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
