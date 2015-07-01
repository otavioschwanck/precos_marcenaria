
xml.instruct!
xml.cities do
  @cities.each do |city|
      xml.city do
        xml.name city.name
        xml.info city_url(city, format: :xml)
      end
  end
end
