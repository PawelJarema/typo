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
  fill_in 'merge_with', :with => arg2
  click_button 'Merge'
end

Then /^the new article should consist of article(\d+) and article(\d+)$/ do |arg1, arg2|
  article = Article.find_by_id(1)
  article.body should == (a1.body + a2.body)
end
