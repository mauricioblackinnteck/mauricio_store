class ProductType < ActiveRecord::Base
	  uniq.map{|c| c.name}.each do |v| 
    self.class.class_eval do
      define_method v.downcase.split(" ").join("_") do 
        find_by_name(v)
      end
    end
  end
  has_many :products
end
