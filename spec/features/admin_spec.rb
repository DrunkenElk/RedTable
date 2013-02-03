# -*- encoding : utf-8 -*-
require 'spec_helper'

feature 'login into admin page' do
  include Rails.application.routes.url_helpers

  def sign_in_as(user, password)
    visit new_user_session_path
    fill_in 'user_email', :with => user
    fill_in 'user_password', :with => password
    click_button I18n.t('devise.sign_in.submit')
  end

  background do
    FactoryGirl.create(:john)
    FactoryGirl.create(:paul)
    FactoryGirl.create(:george)
  end

  scenario 'login as admin' do
    sign_in_as('john@beatles.com', 'beatles')
    visit admin_path
    current_path.should be_eql(admin_path)
    page.should have_content(I18n.t('admin.index.imageboard'))
    page.should have_content(I18n.t('admin.index.users'))
  end

  scenario 'login as moderator' do
    sign_in_as('paul@beatles.com', 'beatles')
    visit admin_path
    current_path.should be_eql(admin_path)
    page.should_not have_content(I18n.t('admin.index.imageboard'))
    page.should_not have_content(I18n.t('admin.index.users'))
  end

  scenario 'login as anonymous' do
    sign_in_as('george@beatles.com', 'beatles')
    visit admin_path
    current_path.should be_eql(root_path)
    page.should have_content(I18n.t('unauthorized.manage.all'))
  end

  scenario 'login as anonymous (without sign_in)' do
    visit admin_path
    current_path.should be_eql(new_user_session_path)
    page.should have_content(I18n.t('devise.sign_in.caption'))
  end

end
