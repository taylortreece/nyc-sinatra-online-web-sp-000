class DropFiguresTable < ActiveRecord::Migration
  def change
    drop_table :figures
  end
end
