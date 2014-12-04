namespace :db do
  desc "Drops db, migrates, and seeds db."
  task :full_reset => :environment do
    Rake::Task['db:drop'].invoke
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
    puts "  You're welcome. Your database be so fresh. So clean."
    puts
  end
end