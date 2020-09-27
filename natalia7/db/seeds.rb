#Seeding admin
=begin
Warning: in case anyone is learning from this repo, 
this is not safe to do on real application as it exposes 
an admin password in plain text. Better not source control this file.
=end

User.create(
  :email => "admin@test.com",
  :role => :admin
  )