describe Category do
  
    #create a new category
    it "creates a new Category" do
      category = Category.new(name: 'Apple')
      expect(category.name).to eq "Apple"
    end

    #deletes one category
    it "deletes category" do
        category = Category.create(name: 'Apple')
        categoryQuery1 = Category.find_by(name: 'Apple') #to get the id of the category
        Category.destroy(categoryQuery1.id)
        categoryQuery2 = Category.where(name: 'Apple') #using where to find in the database
        expect(categoryQuery2.size).to eq(0)
    end

    it "creates a relation between Category and Product" do
        category = Category.new(name: 'Apple')
        product = Product.new(title: 'iPhone', description: 'iPhone X')
        category.products << product
        expect(category.products).to include(product)
    end

    it "creates a relation between Category and Products" do
        category = Category.new(name: 'Apple')
        product1 = Product.new(title: 'iPhone', description: 'iPhone X')
        product2 = Product.new(title: 'Macbook', description: 'Macbook Pro')
        category.products << product1
        category.products << product2
        expect(category.products).to include(product1, product2)
    end
    
  end