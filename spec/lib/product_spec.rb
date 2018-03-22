describe Product do
  
    #create a new product
    it "creates a new Product" do
      product = Product.new(title: 'iPhone', description: 'iPhone X')
      expect(product.title).to eq 'iPhone'
    end

    #deletes one product
    it "deletes Product" do
        product = Product.create(title: 'iPhone', description: 'iPhone X')
        productQuery1 = Product.find_by(title: 'iPhone') #to get the id of the product
        Product.destroy(productQuery1.id)
        productQuery2 = Product.where(title: 'iPhone') #using where to find in the database
        expect(productQuery2.size).to eq(0)
    end

    it "creates a relation between Product and Category" do
        category = Category.new(name: 'Apple')
        product = Product.new(title: 'iPhone', description: 'iPhone X')
        product.categories << category
        expect(product.categories).to include(category)
    end

    it "creates a relation between Product and Categorie" do
        category1 = Category.new(name: 'Apple')
        category2 = Category.new(name: 'Phone')
        product = Product.new(title: 'iPhone', description: 'iPhone X')
        product.categories << category1
        product.categories << category2
        expect(product.categories).to include(category1, category2)
    end
    
  end