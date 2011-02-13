require 'yaml'

raise "Please set SOLUBLE_ENVIRONMENT" unless ENV['SOLUBLE_ENVIRONMENT']

module Soluble
  path = File.dirname(__FILE__)+"/../conf/#{ENV['SOLUBLE_ENVIRONMENT']}.yml"
  @environment = YAML.load(File.read(path))

  def self.environment key
    @environment[key] || {}
  end

  def classify symbol
    symbol.to_s.split('_').map{|part| part.capitalize}.join
  end

  def on_page app, page
    page_class = "#{page}_page"
    require "soluble/pages/#{app}/#{page}_page"
    app_module = Soluble::Pages.const_get classify(app)
    page = Soluble::Pages::Page.new
    page.extend app_module.const_get classify(page_class)
    block_given? ? yield(page) : page  
  end

  def reload_page app, page
    load "soluble/pages/#{app}/#{page}_page.rb"    
  end

  def browse_to app
    $browser.goto Soluble.environment(app)['base_url']
  end
end

require 'soluble/pages/page'
require 'soluble/watir_helper'
