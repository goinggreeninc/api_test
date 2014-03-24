class AddUserIdToCats < ActiveRecord::Migration
  def change
    add_column :cats, :user_id, :integer
    add_index "cats", ["user_id"], name: "index_timeszones_on_user_id", using: :btree
  end
end
