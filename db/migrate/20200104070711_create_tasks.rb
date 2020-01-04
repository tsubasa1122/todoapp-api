class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :content
      t.datetime :expires_at
      t.boolean :completion_flg, null: false, default: false
      t.timestamps

    end
    add_index :tasks, :completion_flg
  end
end
