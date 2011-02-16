require 'soluble/pages/sample_app'

module Soluble::Pages::SampleApp::OrderPage
  include Soluble::WatirHelper
  
  select_list :num_sugars
  radio_button :type
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
    
    %w{num_sugars extras type}.each do |key|
      self.send "#{key}=", parameters[key]
    end
    check_strong if parameters['strong'] = 'true'
    make
  end
end
