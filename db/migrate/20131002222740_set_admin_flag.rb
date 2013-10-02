class SetAdminFlag < ActiveRecord::Migration
  def up
    execute "update users set admin='true' where id=1;"
  end

  def down
    raise ActiveRecord::IrreversibleMigration 
  end
end
