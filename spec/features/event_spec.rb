require 'rails_helper'

describe 'User can CRUD Events' do

  before :each do
    # visit root
    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Home"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on 'Add Event'

    fill_in 'event[description]', :with => 'Dinner Party'
    fill_in 'event[date]', :with => '01/01/2015'
    check 'event[requires_id]'

    click_on 'Create Event'
  end

  scenario 'User can create an event' do

    expect(page).to have_content('Dinner Party')

  end

  scenario 'User can visit a show page for an event' do

    click_on 'Dinner Party'

    expect(page).to have_content('2015-01-01')

  end

  scenario 'User can edit an event' do

    click_on 'Edit'

    fill_in('event[description]', :with => 'Slumber Party' )
    fill_in('event[date]', :with => '03/02/2015' )
    check('event[requires_id]')

    click_on 'Update Event'

    expect(page).to have_content('Slumber Party')

  end


end
