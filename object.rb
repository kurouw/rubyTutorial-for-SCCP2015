class Human
  def initialize(firstName, middleName=nil, familyName, age)
    @name = Name.new(firstName, middleName, familyName)
    @age = age
  end
  
  def to_s
    "#{@name} (#{@age})"
  end
end

class Name
  def initialize(firstName, middleName=nil, familyName)
    @firstName = firstName
    @middleName = middleName
    @familyName = familyName
  end
  
  def to_s
    if @middleName.nil? then
      "#{@firstName.chr}.#{@familyName.chr}."
    else
      "#{@firstName.chr}.#{@middleName.chr}.#{@familyName.chr}."
    end
  end
end

puts Name.new('Barack', 'Obama')
puts Name.new('George', 'W', 'Bush')

puts Human.new('Barack', 'Obama', 54)
puts Human.new('George', 'W', 'Bush', 69)
