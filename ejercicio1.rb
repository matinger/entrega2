module Walk
  def walk
    puts "#{self.to_s} is walking"
  end
end

module Swim
  def swim
    puts "#{self.to_s} is swimming"
  end
end

module Speak
  def speak
    puts "#{self.to_s}} is speaking"
  end
end

module Bark
  def bark
    puts "#{self.to_s}} is barking"
  end
end

module Fly
  def fly
    puts "#{self.to_s}} is flying"
  end
end

module Displace
  def displace
    puts "#{self.to_s}} is shifting"
  end
end

module Jump
  def jump
    puts "#{self.to_s}} is jumping"
  end
end

module Press
  def press
    puts "#{self.to_s}} presses"
  end
end

module Bite
  def bite
    puts "#{self.to_s}} is biting"
  end
end

class Animal; end

class Mammal < Animal; end

class Bird < Animal; end

class Reptile < Animal; end

class Amphibian < Animal; end

class Fish < Animal; end

class Man < Mammal
  include Walk
  include Swim
  include Speak
end

class Dog < Mammal
  include Walk
  include Bark
end

class Whale < Mammal
  include Swim
end

class Eagle < Bird
  include Walk
  include Fly
end

class Penguin < Bird
  include Walk
  include Swim
end

class Crocodile < Reptile
  include Walk
  include Swim
end

class Boa < Reptile
  include Displace
  include Press
end

class Cobra < Reptile
  include Displace
  include Bite
end

class Toad < Amphibian
  include Swim
  include Jump
end

class Shark < Fish
  include Swim
end

#Testing
h = Man.new
h.walk
h.speak

t = Toad.new
t.jump

e = Eagle.new
e.fly

d = Dog.new
d.fly
