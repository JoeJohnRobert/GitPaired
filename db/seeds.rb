# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create(:first_name => 'Mitch', :last_name => 'Boyer', :location => '10004')
u2 = User.create(:first_name => 'Jessica', :last_name => 'Rose',  :location => '11211')
u3 = User.create(:first_name => 'Grace', :last_name => 'Hopper', :location => '11238')

p1 = u1.projects.create(:name => 'Spotify', :collaborator_wanted => true)
p2 = u1.projects.create(:name => 'Facebook', :collaborator_wanted => false)

p3 = u2.projects.create(:name => 'Twitter', :collaborator_wanted => false)
p4 = u2.projects.create(:name => 'Instacart', :collaborator_wanted => true)
    
p5 = u3.projects.create(:name => 'Github', :collaborator_wanted => true)
p6 = u3.projects.create(:name => 'Farecast', :collaborator_wanted => false)    

p1.languages.create(:name => 'C++')
p2.languages.create(:name => 'Java')
p3.languages.create(:name => 'Ruby')
p4.languages.create(:name => 'JS')
p5.languages.create(:name => 'Angular')
p6.languages.create(:name => 'Haskell')

p1.tags.create(:name => 'Music')
p2.tags.create(:name => 'Social')
p3.tags.create(:name => 'Messaging')
p4.tags.create(:name => 'Social')
p5.tags.create(:name => 'Coding')
p6.tags.create(:name => 'Music')
