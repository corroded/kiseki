Rails.application.config.generators do |g|
  g.test_framework :rspec, :views => false, :fixture => false
  g.fixture_replacement :factory_girl, :dir => 'spec/factories'
end
