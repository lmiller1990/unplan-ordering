FactoryGirl.define do
  factory :product do
    theshold_to_order 1
    in_stock 1
    price "9.99"
    name "MyString"
    day_to_order "2016-08-08"
    unit_type "MyString"
    base_product false
    order
    product_list
  end
end
