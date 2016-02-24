require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "it calls the create_resource callback when created" do
    a = Account.create(number: "123")
    assert a.number, "a"
  end

  test "it calls the create_resource_validations callback when created" do
    a = Account.create(number: "123")
    refute a.valid?
    refute a.persisted?
  end

end
