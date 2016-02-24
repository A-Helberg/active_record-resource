require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "it calls the create_resource callback when created" do
    a = Account.create(number: "valid")
    assert_equal a.number, "a"
  end

  test "it calls the create_resource_validations callback when created" do
    a = Account.create(number: "invalid")
    refute a.valid?, "The model should not be valid"
    refute a.persisted?
  end


end
