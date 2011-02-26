When /^I enter the following coffee preferences$/ do |table|
  on_page :sample_app, :order do |page|
    page.apply_with table.rows_hash
  end
end

When /^I enter valid coffee preferences$/ do

  params = {
      'type' => 'latte',
      'num_sugars' => '2',
      'strong' => true,
      'extras' => 'extra hot'
    }

  on_page :sample_app, :order do |page|
    page.fill_in params
    page.submit :make
  end
end

Then /^I should have successfully made an order$/ do
  on_page :sample_app, :summary do |page|
    raise "Did not successfully make order" unless page.success?
  end
end

