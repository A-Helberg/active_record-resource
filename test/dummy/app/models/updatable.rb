class Updatable < ActiveRecord::Base
  def resource_create_validations
    true
  end

  def resource_create
    true
  end

  def resource_delete_validations
    true
  end

  def resource_delete
    true
  end

  def resource_update
    self.number = "a"
  end

  def resource_update_validations
    unless self.number == "valid"
      errors[:number] << 'Need a name starting with X please!'
      false
    end
  end
end
