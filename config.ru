require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

# PATCH and DELETE requests
user Rack::MethodOverride

# here is where I will mount otyher controllers with 'use'
run ApplicationController
