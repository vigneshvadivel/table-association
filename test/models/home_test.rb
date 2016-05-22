require 'test_helper'

class HomeTest <ActiveSupport::TestCase
  def setup
    @owner = Owner.create(ownername: "vel", email: "vel@example.com")
    @home = @owner.homes.build(name:"my sweet home", summary:"This is the my best place forever",description:"all family all relation in one place its good to known our love")
  end  
  
  test "home should be valid" do
    assert @home.valid?
  end
  
  test "owner_id should be present" do
    @home.owner_id =nil
    assert_not @home.valid?
  end
  
  
  
  test "name should be present" do
     @home.name=" "
     assert_not @home.valid?
   end
  
  test "name length not be too long" do
    @home.name= "a" * 101
    assert_not @home.valid?
  end
  
  test "name length not be too short" do
    @home.name= "aaaa"
    assert_not @home.valid?
  end
  test "summary should be present" do
    @home.summary= " "
    assert_not @home.valid?
  end
  
  test "summary length not be too long" do
    @home.summary= "a" * 151
    assert_not @home.valid?
  end
  
  test "summary length not be too short" do
    @home.summary= "a" * 9
    assert_not @home.valid?
  end
  
  test "description must be present" do
    @home.description= " "
    assert_not @home.valid?
  end
  
  test "description should not be too long" do
    @home.description= "a" * 501
    assert_not @home.valid?
  end
  
  test "description should not be too short" do
    @home.description= "a" * 19
    assert_not @home.valid?
  end
end
    