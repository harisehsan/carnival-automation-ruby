# carnival-automation-ruby

Pre-requisites
Ruby (tested with v2.4.1)
Bundler (run gem install bundler to install it if you don't have it)
Firefox (tested with Firefox v69.0.3 - 64-bit)
Geckodriver (tested with v0.26.0 - run brew install geckodriver if you don't have it)
Chrome (tested with v70)
Chromedriver (tested with v78.0.3904.70 - run brew tap homebrew/cask && brew cask install chromedriver if you don't have it)
Setup and How to Use
Copy the .env file to a file named .env.local and edit it according to your preferences.

Run bundle install to install all of the necessary gems.

Run bundle exec rspec to launch the test suite.

To use different web browsers, simply set your 'WEBDRIVER' environment variable. The options available for the WEBDRIVER setting are:

chrome
chrome_headless
firefox
firefox_headless
