class Human
  
  @@population = 0
  @@family_population = {}
  
  def initialize(firstName, middleName=nil, familyName, age)
    @name = Name.new(firstName, middleName, familyName)
    @age = age
    @@population+=1

    if @@family_population[familyName].nil? then
      @@family_population[familyName] = 1
    else
      @@family_population[familyName]+=1
    end
  end
  
  
  def to_s
    "#{@name} (#{@age})"
  end

  def self.family_population(familyName)
    if @@family_population[familyName].nil? then
      0
    else
      @@family_population[familyName]
    end
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

Human.new('Willard', 'Smith', 47)
Human.new('Shelley', 'Smith', 43)
Human.new('Frank', 'Williams', 63)
Human.new('Scott', 'Brown', 32)
Human.new('Jane', 'Brown', 25)
Human.new('Bobby', 'Brown', 22)

puts Human.family_population('Smith')
puts Human.family_population('Williams')
puts Human.family_population('Brown')
