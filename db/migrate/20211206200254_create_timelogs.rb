class CreateTimelogs < ActiveRecord::Migration[6.1]
  def change
    create_table :timelogs do |t|
      t.references :user, null: false, foreign_key: true
      t.timestamp :clock_in
      t.timestamp :clock_out

      t.timestamps
    end
  end
end
