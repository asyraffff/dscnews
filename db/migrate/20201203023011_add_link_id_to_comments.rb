class AddLinkIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_column :comments, :link_id, :integer
  end
end
