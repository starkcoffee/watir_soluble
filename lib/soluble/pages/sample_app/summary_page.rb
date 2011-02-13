require 'soluble/pages/sample_app'

module Soluble::Pages::SampleApp::SummaryPage
  include Soluble::WatirHelper
  
  div :confirmation

  def success?
    confirmation_text.include? "Here is your coffee"
  end
end
