class FixEditUrlName < ActiveRecord::Migration
  def change
      rename_column :polls, :edit_url, :admin_token
    end

end
