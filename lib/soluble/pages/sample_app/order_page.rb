require 'soluble/pages/sample_app'

module Soluble::Pages::SampleApp::OrderPage
  include Soluble::WatirHelper
  
  select_list :num_sugars
  radio_button :type
  checkbox :strong, {:name => 'strong'}
  text_field :extras, {:id => 'coffee-extras'}
  button :make

end
