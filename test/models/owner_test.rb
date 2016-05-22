require 'test_helper'
class OwnerTest <ActiveSupport::TestCase
def setup
  @owner = Owner.new(ownername:"vel", email: "vel@example.com")
end

test "owner should be valid" do
    assert @owner.valid?
  end
  test "ownername should be present" do
     @owner.ownername=" "
     assert_not @owner.valid?
   end
   test "ownername should be too long " do
     @owner.ownername = "a" * 41
     assert_not @owner.valid?
   end
   
   test "ownername should be too short " do
     @owner.ownername = "aa"
     assert_not @owner.valid?
   end
   
   test "email should be present " do
     @owner.email = " "
     assert_not @owner.valid?
   end
   
   test "email length should be within bounds " do
     @owner.email = "a" * 101 + "@example.com"
     assert_not @owner.valid?
   end
   
   test "email address should be unique " do
     dup_owner = @owner.dup
     dup_owner.email = @owner.email.upcase
     @owner.save
     assert_not dup_owner.valid?
   end
   test "email address should  accept valid address" do
   valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.com laura+joe@monk.cm]
   valid_addresses.each do |va|
     @owner.email = va
     assert @owner.valid? '#{va.inspect} should be valid'
   end
 end
   
   
   test "email address should  reject invalid address" do
   invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.com foo@ee+aar.com]
   invalid_addresses.each do |ia|
     @owner.email = ia
     assert_not @owner.valid?  '#{ia.inspect}should be invalid'
   end
 end
   
   
   
   
   
   
   
   
   
   
   
   
   
   
end
