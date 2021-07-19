# frozen_string_literal: true

require 'pry'
require_relative '../../spec_helper'

feature 'User is able to filter and narrow results from landing page and then start the booking process.', type: :feature, js: true do

  scenario 'TC1 Verify that SAIL TO and DURATION filters are narrowing the results' do
    home_page.load
    home_page.skip_popup
    home_page.narrow_results_by_filter
    expect(home_page.compare_number_of_results)
  end

  scenario 'TC2 Verify that {{secondary_filter}} filter is narrowing the results after applying SAIL TO and DURATION filters' do
    home_page.load
    home_page.skip_popup
    home_page.narrow_results_by_filter
    home_page.go_to_url
    expect(home_page.verify_the_price_filter)
  end

end
