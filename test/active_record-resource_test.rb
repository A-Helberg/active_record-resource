require 'test_helper'

class ActiveRecord::ResourceTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, ActiveRecord::Resource
  end
end
