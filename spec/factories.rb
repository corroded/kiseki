require 'factory_girl'

Factory.define :user do |u|
  u.email           'imacaterpillar@gmail.com'
  u.password        'please'
end

