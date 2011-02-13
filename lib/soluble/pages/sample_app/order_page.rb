require 'soluble/pages/sample_app'

module Soluble::Pages::SampleApp::OrderPage
  include Soluble::WatirHelper

  %w{flat_white latte}.each {|name| radio_button name, {:value => name } }
  select_list :num_sugars 
  checkbox :strong, {:name => 'strong'}
  text_field :extras, {:id => 'coffee-extras'}
  button :make

  def apply_with overrides={}
    parameters = {
      'type' => 'latte',
      'num_sugars' => '2',
      'strong' => 'true',
      'extras' => 'extra hot'
    }.merge overrides
    self.send "select_#{parameters['type']}"
    %w{num_sugars extras}.each do |key|
      self.send "#{key}=", parameters[key]
    end
    check_strong if parameters['strong'] = 'true'
    make
  end
end
