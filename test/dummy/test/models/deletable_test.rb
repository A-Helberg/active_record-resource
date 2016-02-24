require 'test_helper'

class DeletableTest < ActiveSupport::TestCase
  test "it calls the delete_resource callback when deleted" do
    a = Deletable.create(number: "valid")
    a.destroy
    assert a.destroyed?
    assert_equal "a", a.number
  end

  test "it calls the delete_resource_validations callback before deleting" do
    a = Deletable.new(number: "invalid")
    a.save(validate: false)
    assert a.persisted?
    a.destroy
    refute a.destroyed?, "should not destroy because of validations"
    assert a.errors
  end
end
