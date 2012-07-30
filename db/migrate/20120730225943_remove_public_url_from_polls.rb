class RemovePublicUrlFromPolls < ActiveRecord::Migration
  def up
    remove_column :polls, :public_url
  end

  def down
    add_column :polls, :public_url, :string
  end
end
