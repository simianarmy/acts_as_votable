require 'rails_generator'

class ActsAsVotableGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory('db/migrate')
      m.migration_template 'migration.rb', 'db/migrate', :migration_file_name => "create_votes"
    end
  end

  protected

  def banner
    <<-EOS
    Creates acts_as_votables migration

    USAGE: #{$0} acts_as_votable
    EOS
  end
end