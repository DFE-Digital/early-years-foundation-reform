desc "Tasks triggered by sys admins"
namespace :sys_admin_tasks do
  desc "destroy user"
  task :destroy_user, [:email] => :environment do |_, args|
    User.find_by(email: args.email).destroy!
  rescue NoMethodError
    throw StandardError.new("User not found")
  end
end
