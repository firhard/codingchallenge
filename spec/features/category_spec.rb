require 'rails_helper'

describe 'Category' do

  #check if createdf category is in index page
  specify 'addCategory' do
    c1 = Category.create(name: "Apple")
    visit '/categories'

    expect(page).to have_content c1.name
  end

  # delete category
  specify 'deleteCategory' do
    c1 = Category.create(name: "Apple")
    visit '/categories'

    click_on 'Delete ' + c1.name.to_s

    expect(page).to have_content 'Category was successfully destroyed.'
  end

  # create a new category
  specify 'addNewCategory' do 
    p1 = Product.create(title: 'iPhone X', description: 'Latest iPhone')
    visit '/'
    click_on 'New Category'
    fill_in 'Name', with: 'Apple'
    page.check p1.title
    click_on 'Save'

    expect(page).to have_content 'Category was successfully created'
  end

  # check if product created is in the category list
  specify 'clickCategoriesName' do
    p1 = Product.create(title: 'iPhone', description: 'iPhone X')
    # lecture = FactoryGirl.create(:lecture)
    c1 = Category.create(name: 'Apple')
    p1.categories << c1
    visit '/'
    click_link c1.name

    expect(page).to have_content p1.title
    expect(page).to have_content p1.description
    expect(page).to have_content c1.name
  end

  # check if product created is in two of the categories list
  specify 'checkmorethanoneCategory' do
    p1 = Product.create(title: 'iPhone', description: 'iPhone X')
    # lecture = FactoryGirl.create(:lecture)
    c1 = Category.create(name: 'Apple')
    c2 = Category.create(name: 'Phone')
    p1.categories << c1
    p1.categories << c2

    visit '/'
    click_link c1.name
    expect(page).to have_content p1.title
    expect(page).to have_content p1.description
    expect(page).to have_content c1.name
    
    #back to initial page
    visit '/'
    click_link c2.name
    expect(page).to have_content p1.title
    expect(page).to have_content p1.description
    expect(page).to have_content c2.name
  end
  
end


  


