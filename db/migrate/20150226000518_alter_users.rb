class AlterUsers < ActiveRecord::Migration
  
  def up
  	rename_table("users", "admin_users")
  	add_column("admin_users", "username", :string, :limit => 25, :after => "email")
  	change_column("admin_users", "email", :string, :limit => 100)
  	rename_column("admin_users", "password", "hashed_password")

  	puts "*** Adding an index is next ***"
  	
  	add_index("admin_users", "username")
  end

  def down
  	add_index("admin_users", "username")
  	rename_column("admin_users", "password", "hashed_password")
  	change_column("admin_users", "email", :string, :limit => 100)
  	add_column("admin_users", "username", :string, :limit => 25, :after => "email")
 	rename_table("users", "admin_users")	
  end

end
