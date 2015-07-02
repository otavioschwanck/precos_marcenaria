
xml.instruct!

xml.products do
  @city.branches.each do |branch|
      branch.products.each do |product|
        xml.product do
          xml.name product.name
          xml.description product.description
          xml.value product.value
          xml.last_update "Ultima atualização:" + l(product.updated_at)
          xml.branch_name product.branch.name
          xml.branch_phone product.branch.phone

          xml.image request.host + product.imagem.url
        end
      end
    end
  end
