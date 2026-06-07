class SetDefaultStatusOnArticlesAndComments < ActiveRecord::Migration[8.1]
  def change
    change_column_default :articles, :status, "public"
    change_column_default :comments, :status, "public"
  end
end