
xml.instruct!

xml.products do
  @city.branches.each do |branch|
      branch.products.each do |product|
        xml.product do
          xml.name product.name
          xml.description product.description
          xml.value product.value
        end
      end
    end
  end
