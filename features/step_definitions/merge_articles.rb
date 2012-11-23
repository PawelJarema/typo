Given /^two articles exist$/ do
  a1 = Article.new(:title => "article1", :body => "body1")
  a1.save
  a2 = Article.new(:title => "article2", :body => "body2")
  a2.save
end

Given /^a regular, non admin user exists$/ do
  User.create(:login => "regular_user", :password => "kkkkk", :email => "ru@gmail.com", :profile_id => 2)
end

When /^I merge article(\d+) with article(\d+)$/ do |arg1, arg2|
  visit "/admin/content/edit/#{arg1}"
  fill_in 'merge_with', :with => 1
  click_button 'Merge'
end

Then /^the new article should consist of article(\d+) and article(\d+)$/ do |arg1, arg2|
  article1 = Article.find(1)
  article2 = Article.find(1)
  article1.merge_with(article2.id)
  article1.body.should == article2.body + article2.body
end
