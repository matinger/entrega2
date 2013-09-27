class Product
    attr_accessor :code, :name, :price

    def initialize(code, name, price)
        @code = code
        @price = Float(price)
        @name = name
    end

    
end

class Purchase
    attr_accessor :products

    def initialize
        @products = []
    end

    def add(product)
        @products << product
    end

    def delete(product)
	@products.delete(product)
    end

    def total
        total = 0.0
        @products.each do |product| 
            sum += product.price
        end
        total
    end

    def apply_discount
        yield(self)
    end
end



p1 = Product.new '01', 'Martillo', '50'
p2 = Product.new '02', 'Clavos x 100', '10'

p = Purchase.new
p.add p1
p.add p2

p.total
# => 60

# Descuento de 10% en tu compra si llevás algún martillo!
p.apply_discount do |purchase|
  hammers = purchase.products.collect { |product| product.code == '01'  }
  purchase.total -= purchase.total * 0.1 if hammers.any?
end

p.total
# => 54.0
