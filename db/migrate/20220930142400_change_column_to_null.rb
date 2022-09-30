class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def change
    #articleのcategory_id -> not nullを外す
    change_column_null :articles, :category_id, true
  end
end
