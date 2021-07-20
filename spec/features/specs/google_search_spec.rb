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

  scenario 'TC3 Verify that user is able to trigger the booking process through LEARN MORE page' do
    home_page.load
    home_page.skip_popup
    home_page.narrow_results_by_filter
    home_page.view_details_of_iternity
    expect(home_page.verify_the_traveler_information_title)
  end

  scenario 'TC5 Verify that SEARCH CRUISES button is retrieving first {{max_per_page}} cheapest available cruises' do
    home_page.load
    home_page.skip_popup
    home_page.apply_filter_for_more_results
    expect(home_page.verify_load_more_button)
  end
