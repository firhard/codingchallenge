require 'rails_helper'

describe 'Product' do
  specify 'add Product' do
    p1 = Product.create(title: 'iPhone', description: 'iPhone X')
    visit '/products'

    expect(page).to have_content p1.title
    expect(page).to have_content p1.description
  end

   # delete Product
   specify 'deleteProduct' do
    p1 = Product.create(title: 'iPhone X', description: 'Latest iPhone')
    
    visit '/products'

    click_on 'Destroy ' + p1.title.to_s

    expect(page).to have_content 'Product was successfully destroyed.'
  end

  # create a new Product
  specify 'addNewProduct' do 
    c1 = Category.create(name: "Apple")
    visit '/products'
    click_on 'Create Product'
    fill_in 'Title', with: 'iPhone'
    fill_in 'Description', with: 'iPhone X'
    page.check c1.name
    click_on 'Save'

    expect(page).to have_content 'Product was successfully created'
  end
end


