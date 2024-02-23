# rake --tasks eyfs:cms
#
require 'upload'

namespace :hfeyp do
  namespace :cms do
    desc 'Upload existing pages'
    task upload: :environment do
      Upload.new.call
    end

    desc 'Define Contentful entry models'
    task migrate: :environment do
      migrations = Dir[Rails.root.join('lib/cms/migrate/*')]
      token = ContentfulRails.configuration.management_token
      space = ContentfulRails.configuration.space
      env = ContentfulRails.configuration.environment

      migrations.each do |file|
        system <<~CMD
          contentful space migration \
          --management-token #{token} \
          --space-id #{space} \
          --environment-id #{env} \
          --yes #{file}
        CMD
      end
    end
  end
end
