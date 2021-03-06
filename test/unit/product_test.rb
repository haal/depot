require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  test "product attributes must not be empty" do
  	product = Product.new
  	assert product.invalid?
  	assert product.errors[:title].any?
  	assert product.errors[:description].any?
  	assert product.errors[:image_url].any?
  	assert product.errors[:price].any?
  end

  test "product price must be positive" do
  	product = Product.new(
  		:title => 'Agile web dev',
  		:description => 'This is very good book!',
  		:image_url => 'agile_web.jpg',
  		)
  	product.price = -1
  	assert product.invalid?
  	assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

  	product.price = 1
  	assert product.valid?
  end

  test "product title must be at least 10 characters long" do
  	product = products(:short_title)
  	assert product.invalid?
  	assert_equal "Please enter at least 10 characters", product.errors[:title].join('; ')
  end

   def new_product(image_url)
    Product.new(:title       => "My Book Title",
                :description => "yyy",
                :price       => 1,
                :image_url   => image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end

  test "product is not valid without a unique title" do
    product = Product.new(:title       => products(:ruby).title,
                          :description => "yyy", 
                          :price       => 1, 
                          :image_url   => "fred.gif")

    assert !product.save
    assert_equal "has already been taken", product.errors[:title].join('; ')
  end

  test "product is not valid without a unique title - i18n" do
    product = Product.new(:title       => products(:ruby).title,
                          :description => "yyy", 
                          :price       => 1, 
                          :image_url   => "fred.gif")

    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken'),
                 product.errors[:title].join('; ')
  end

  test "add unique and duplicate products" do
    unique_product_1 = Product.new(:title       => 'Unique book name',
                                :description => products(:ruby).description, 
                                :price       => products(:ruby).price, 
                                :image_url   => products(:ruby).image_url)
    duplicate_product_1 = products(:ruby)

    assert unique_product_1.save, "Failed #{unique_product_1.title} because of #{unique_product_1.errors.messages}"
    #error on save duplicate
    # assert !duplicate_product_1.save, "Failed #{duplicate_product_1.title} because of #{duplicate_product_1.errors.messages}"
  end

end
