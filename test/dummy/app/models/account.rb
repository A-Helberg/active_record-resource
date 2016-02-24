class Account < ActiveRecord::Base
  def resource_create_validations
    unless self.number == "valid"
      errors[:number] << 'Need a name starting with X please!'
    end
  end

  def resource_create
    self.number = "a"
  end

  def resource_delete_validations
    true
  end

  def resource_delete
    true
  end
end
