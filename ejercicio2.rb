class Product
  attr_accessor :code, :name, :price
  
  def initialize(code, name, price)
    @code = code
    @price = Float(price)
    @name = name
  end   
end

class Purchase
  attr_accessor :products, :total
  
  def initialize
    @total = 0.0
    @products = []
  end
  
  def add(product)
    @total += product.price
    @products << product
  end
  
  def delete(product)
    @total -= product.price
    @products.delete(product)
  end

  def total    
    @total
  end
  
  def cleandiscount
    @total = 0.0
    @products.each do |product| 
        @total += product.price
    end
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

p p.total
# => 60

# Descuento de 10% en tu compra si llevás algún martillo!
p.apply_discount do |purchase|
  hammers = purchase.products.collect { |product| product.code == '01' }
  purchase.total -= purchase.total * 0.1 if hammers.any?
end

p p.total
# => 54.0

# Descuento de 20% en tu compra si tiene más de 10 productos!
p.apply_discount do |purchase|
  purchase.total *= 0.8 if purchase.products.size > 10
end

p p.total
# => 54.0

3.times do 
  p.add p1
end

p.cleandiscount

#Si la lista de productos tiene más de 3 productos iguales, cada 3 paga 2
p.apply_discount do |purchase|
  prices = {}
  counts = Hash.new(0)

  purchase.products.each do |product|
    counts[product.code] += 1
    prices[product.code] ||= product.price
  end
  counts.each do |key, value|
    if value > 3
      productsdiscount = value.div 3
      purchase.total -= productsdiscount * prices[key]
    end
  end 
end

p p.total
# => 160.0

