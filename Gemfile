source 'http://rubygems.org'

gem 'rails', '3.0.3'
gem 'sqlite3'

group :development do
  gem 'rspec-rails', '>=2.5'
end


group :test do
  gem 'rspec-rails','>= 2.5'
  gem 'webrat', '0.7.1'
  gem 'factory_girl_rails', '1.0'
  gem 'autotest'
  gem 'autotest-growl'
end

# This gem doesn't exist anymore
  # gem 'annotate-models', '1.0.4'
# This gem is breaking bundler.
 # gem 'autotest-fsevent'


## Notes on bundle:
## ------------------------
# In order to use autotest-growl, install either the comprehensive 
# ZenTest gem or the lightweight autotest-standalone gem and then add the 
# following line to your ~/.autotest file: require 'autotest/growl'

# Make sure the notification service installed on your computer:
  # http://growl.info (Growl for Mac OS X)
  # http://growlforwindows.com (Growl for Windows)
  # http://www.galago-project.org (libnotify for Linux)
# If Growl notifications are not always displayed, take a look at the README
# for assistance.

# For more information, feedback and bug submissions, please visit:
# http://www.bitcetera.com/products/autotest-growl
# If you like this gem, please consider to recommend me on Working with
# Rails, thank you!
# http://workingwithrails.com/recommendation/new/person/11706-sven-schwyn