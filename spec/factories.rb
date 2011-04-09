Factory.define :user do |user|
  user.name                   "Kevin Horst"
  user.email                  "krhorst@gmail.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end

Factory.define :group do |group|
  group.name                  "This Group"
end