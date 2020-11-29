namespace :dev do
  desc "TODO"
  task config: :environment do
    %x(rake db:seed)
  end

end
