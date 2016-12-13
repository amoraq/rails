require 'rails_helper'

RSpec.describe 'editing user' do
    it 'displays populated form'
    user = create_user
    login_user user
    click_link 'Edit Profile'
    expect(page).to have_field('Email')
    expect(page).to have_field('Name')
end
