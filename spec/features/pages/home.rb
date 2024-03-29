# frozen_string_literal: true

module Pages
  class Home < SitePrism::Page
    set_url '/'
    MaxPrice=600

    element :search_field, 'input[title="Search"]'
    element :search_button, 'input[value="Google Search"]'
    element :no_thanks_button, '#MainBody > div.vifp-sweeps-modal > div > div.vifp-no-thankyou'
    element :sail_to_dropdown, '#cdc-destinations'
    element :bermuda_button, '.cdc-filter-5-cols-layout:nth-child(3) > .cdc-filter-button'
    element :duration_dropdown, '#cdc-durations'
    element :six_to_nine_days_button, '.cdc-filter-3-cols-layout:nth-child(2) > .cdc-filter-button'
    element :search_button, '.cdc-filters-search-cta:nth-child(1) > .cdc-filters-search-cta-title'
    element :search_number_lbl, '.sbsc-container__result-count'
    elements :search_results_wigits, 'article'
    element :first_item_price, 'body > div:nth-child(11) > form:nth-child(2) > div:nth-child(8) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > ccl-cruise-search:nth-child(1) > div:nth-child(4) > ccl-view-result-container:nth-child(3) > div:nth-child(1) > ccl-view-result-list:nth-child(1) > article:nth-child(1) > ccl-view-result-list-item:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > ul:nth-child(1) > li:nth-child(1) > p:nth-child(1) > span:nth-child(1) > span:nth-child(1) > span:nth-child(2) > span:nth-child(1)'
    element :view_item, 'body > div:nth-child(11) > form:nth-child(2) > div:nth-child(8) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > ccl-cruise-search:nth-child(1) > div:nth-child(4) > ccl-view-result-container:nth-child(3) > div:nth-child(1) > ccl-view-result-list:nth-child(1) > article:nth-child(3) > ccl-view-result-list-item:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(2) > div:nth-child(3) > div:nth-child(1) > a:nth-child(4)'
    element :review_trip_button, '.diagonal-button-new > span'
    element :save_label_btn,'.be-itinerary__save-image'
    element :continue_btn,'.be-btn.be-btn--primary.be-btn--large.be-hdr-d__col-continue'
    element :traveler_information_lbl,'#ges-heading'
    elements :price_lbl,'span.vrl-item__price'
    element :bahamas_btn,'.cdc-filter-5-cols-layout:nth-child(2) > .cdc-filter-button'
    element :canada_btn, '.cdc-filter-5-cols-layout:nth-child(4) > .cdc-filter-button'
    element :caribbean_btn, '.cdc-filter-5-cols-layout:nth-child(5) > .cdc-filter-button'
    elements :load_more_btn, '.vrcn-load-more__text.ng-binding'



    # -------------------------------------------
    # Getter methods
    # -------------------------------------------

    # -------------------------------------------
    # Action items
    # -------------------------------------------

    def search_for(text: '')
      search_field.set(text)
      search_button.click
    end

    def skip_popup
      no_thanks_button.click
    end

    def narrow_results_by_filter
      sail_to_dropdown.click
      bermuda_button.click
      duration_dropdown.click
      six_to_nine_days_button.click
      search_button.click
    end

    def compare_number_of_results
      (search_number_lbl.text.delete("^0-9") == (search_results_wigits.size-1))
    end

    def go_to_url
      SitePrism::Page.set_url 'https://www.carnival.com/cruise-search?layout=list#?dest=bm&dur=d2&layout=list&numAdults=2&pageNumber=1&pageSize=8&priceFrom=500&priceTo=600&showBest=true&sort=fromprice'
    end
    def verify_the_price_filter
      first_item_price.text.delete("^0-9").to_i < MaxPrice
    end

    def view_details_of_iternity
      view_item.click
      review_trip_button.click
      save_label_btn.click
      continue_btn.click
    end
    def verify_the_traveler_information_title
      traveler_information_lbl.text =='TRAVELER INFORMATION'
    end

  def apply_filter_for_more_results
    sail_to_dropdown.click
    bahamas_btn.click
    bermuda_button.click
    canada_btn.click
    caribbean_btn.click
    duration_dropdown.click
    six_to_nine_days_button.click
    search_button.click
  end

  def verify_load_more_button
    load_more_btn.size > 0
  end
    end
  end

module PageNameHelpers
  def home_page
    Pages::Home.new
  end
end
