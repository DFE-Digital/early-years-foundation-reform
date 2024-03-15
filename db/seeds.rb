Seeder = Dibber::Seeder

Seeder.seed(:user, name_method: :email) if Rails.application.credentials.user_password.present?

Rails.logger.info 'Seeding completed'
Seeder.report.each { |line| Rails.logger.info line }
