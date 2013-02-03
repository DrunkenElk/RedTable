# -*- encoding : utf-8 -*-
require 'factory_girl'

FactoryGirl.define do
  factory :john, :class => User do |u|
    u.role 'admin'
    u.email 'john@beatles.com'
    u.password 'beatles'
    u.password_confirmation 'beatles'
  end
  
  factory :paul, :class => User do |u|
    u.role 'moderator'
    u.email 'paul@beatles.com'
    u.password 'beatles'
    u.password_confirmation 'beatles'
  end
  
  factory :george, :class => User do |u|
    u.role 'anonymous'
    u.email 'george@beatles.com'
    u.password 'beatles'
    u.password_confirmation 'beatles'
  end
end
