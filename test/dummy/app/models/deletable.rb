class Deletable < ActiveRecord::Base
  def resource_create_validations
    true
  end

  def resource_create
    true
  end

  def resource_delete_validations
    unless self.number == "valid"
      errors[:number] << 'Need a name starting with X please!'
      false
    end
  end

  def resource_delete
    self.number = "a"
  end
end
