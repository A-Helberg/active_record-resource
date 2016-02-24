class Account < ActiveRecord::Base
  def resource_create_validations
    errors[:number] << 'Need a name starting with X please!'
  end

  def resource_create
    number = "a"
  end
end
