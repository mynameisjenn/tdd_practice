#  Use TDD principles to build out name functionality for a Person.
#  Here are the requirements:

# - Add a method to return the full name as a string. A full name includes
#   first, middle, and last name. If the middle name is missing, there shouldn't
#   have extra spaces.
# - Add a method to return a full name with a middle initial. If the middle name
#   is missing, there shouldn't be extra spaces or a period.
# - Add a method to return all initials. If the middle name is missing, the
#   initials should only have two characters.
#
# We've already sketched out the spec descriptions for the #full_name. Try
# building the specs for that method, watch them fail, then write the code to
# make them pass. Then move on to the other two methods, but this time you'll
# create the descriptions to match the requirements above.

class Person
  def initialize(first_name:, middle_name: nil, last_name:)
    @first_name = first_name
    @middle_name = middle_name
    @last_name = last_name
  end

  def full_name
    if @middle_name == nil
      "#{@first_name}" + " " + "#{@last_name}" 
    else
      "#{@first_name}" + " " + "#{@middle_name}" + " " + "#{@last_name}" 
    end
  end

  def full_name_with_middle_initial 
    if @middle_name == nil
      "#{@first_name}" + " " + "#{@last_name}" 
    else
      "#{@first_name}" + " " + "#{@middle_name.chr}" + " " + "#{@last_name}"
    end 
  end

  def initials
    if @middle_name == nil
      "#{@first_name.chr}" + " " + "#{@last_name.chr}" 
    else
      "#{@first_name.chr}" + " " + "#{@middle_name.chr}" + " " + "#{@last_name.chr}"
    end 
  end

end

RSpec.describe Person do
  describe "#full_name" do
        it "concatenates first name, middle name, and last name with spaces" do
        person = Person.new(
                            first_name: "Bob", 
                            middle_name: "John", 
                            last_name: "Smith")

        expect(person.full_name).to eq("Bob John Smith")
      end

        it "does not add extra spaces if middle name is missing" do 
        person = Person.new(first_name: "Bob", 
                            middle_name: nil, 
                            last_name: "Smith")

        expect(person.full_name).to eq("Bob Smith")
      end
    end

    describe "#full_name_with_middle_initial" do
      it "concatenates first name, middle initial and last name with spaces" do
      person = Person.new(first_name: "Sam", 
                          middle_name: "Michael", 
                          last_name: "Hawkins")

      expect(person.full_name_with_middle_initial).to eq("Sam M Hawkins")

    end
      it "does not add extra spaces if middle name is missing" do    
        person = Person.new(first_name: "Sam", 
                            middle_name: nil, 
                            last_name: "Hawkins")

        expect(person.full_name_with_middle_initial).to eq("Sam Hawkins")
    end
  end

  describe "#initials" do
    it "returns all first initials of first name, middle name and last name" do
      person = Person.new(first_name: "Jennifer", 
                          middle_name: "Lynn", 
                          last_name: "Hatton")

      expect(person.initials).to eq("J L H")
    end

    it "does not add extra spaces if middle name is missing" do    
        person = Person.new(first_name: "Jennifer", 
                            middle_name: nil, 
                            last_name: "Hatton")

        expect(person.initials).to eq("J H")
    end

  end
end