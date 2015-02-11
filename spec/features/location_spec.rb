require 'rails_helper'


describe 'User can CRUD locations' do

  scenario 'User can create a Location' do
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


    #now we expect the index page to have the name of the location we created.
    expect(page).to have_content('Home')
    # expecting the flash notification
    expect(page).to have_content("Location was successfully created")

  end

  scenario 'User can view a show page for a location' do

    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Home"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on "Home"

    expect(page).to have_content('Location Address:')

  end



  scenario 'User can edit a location' do

    visit '/'

    # click on link to go to new location form
    click_on "New Location"

    #filling out form for location
    fill_in 'location[name]', :with => "Home"
    fill_in 'location[address]', with: "New Address"
    fill_in 'location[zipcode]', with: "90210"

    #submitting form to create a location
    click_on "Create Location"

    click_on "Edit"

    expect(page).to have_content('Edit Location')
    find_field('location[name]').value.should eq 'Home'

    fill_in 'location[name]', :with => "Work"

    click_on "Update Location"

    expect(page).to have_content('Work')

  end


  scenario 'User can delete a location' do
    #fill in
  end






end
