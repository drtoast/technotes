namespace :something do
  
  desc "do something with no arguments; rake something:blah"
  task :blah do
    puts "blah"
  end
  
  desc "do something with arguments; rake something:name[John,Dough]"
  task :name, :first_name, :last_name, :needs => :environment do |t, args|  
       args.with_defaults(:first_name => "John", :last_name => "Dough")  
       puts "First name is #{args.first_name}"  
       puts "Last  name is #{args.last_name}"  
  end
  
end
