When /^I enter the following coffee preferences$/ do |table|
  on_page :sample_app, :order do |page|
    page.apply_with table.rows_hash
  end
end

When /^I enter valid coffee preferences$/ do
  on_page :sample_app, :order do |page|
    page.apply_with {}
  end
end

Then /^I should have successfully made an order$/ do
  on_page :sample_app, :summary do |page|
    raise "Did not successfully make order" unless page.success?
  end
end

