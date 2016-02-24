require 'test_helper'

class UpdatableTest < ActiveSupport::TestCase
  test "it calls the resource_update callback when update" do
    a = Updatable.create(number: "")
    a.update(number: "valid")
    assert_equal "a", a.number
  end

  test "it calls the resource_update_validations callback before deleting" do
    a = Updatable.create(number: "")
    a.update(number: "invalid")
    refute a.valid?
  end
end
