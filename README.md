# ActiveRecord::Resource
## Introduction
A lot of gems targeted at rails, at somepoint, end up calling one of find, update, create or destroy on your models.

This makes designing a system cumbersome, where does your business logic go? There are a lot of debates around where to put your business rules and how to structure it, but most of the ways I have found, seem to end up with me fighting against rails, because you are giving up some ease of use for a better architecture.

This gem proposes putting the business logic behind your models, by treating Models as Resources, as they are defined in REST.

##Installation
Add the following to your Gemfile and bundle
`gem 'active_record-resource'`

That's it! The gem is installed.

##Usage
In REST there are only 4 things you can do with a resource and they map to CRUD via HTTP methods. This gem expects you to implement the logic for each one of these possible methods, and that method's corresponding validations

When using this gem, it expects 6 methods on each of your models.

* `resource_create`
* `resource_create_validations`
* `resource_delete`
* `resource_delete_validations`
* `resource_update`
* `resource_update_validations`

Each of these will be called before calling , `create`, `update` and `destroy` on your models.

## Intent
This gem is an experiment in creating an unobtrusive way to structure your domian logic, without interfering with the way rails works, ie. this gem should work with any other gem (in theory).

It is also an experiment in using models as resources, instead of domain objects.

## Example
``` ruby
class Account < ActiveRecord::Base
  def resource_create_validations
    errors.messages[:ballance] = "you need to have a starting ballance of $50 to open an account" unless ballance >= 50
  end

  def resource_create
    send_welcome_email
  end

  def resource_delete_validations
    errors.messages[:ballance] = "you cannot have money in your account when closing it" unless ballance == 0	
  end

  def resource_delete
    send_sad_to_see_you_go_email
  end

  def resource_update_validations
    errors.messages[:account] = "you cannot update your account"
  end

  def resource_update
    # You are not allowed to update and account
    false
  end
end

class Transaction < ActiveRecord::Base
  def resource_create_validations
    unless from_account.ballance >= amount
      errors.messages[:from_account] = "you don't have enough money to make this transaction"
    end
  end

  def resource_create
    from_account.ballance = from_account.ballance - amount
    to_account.balance = to_account.ballance + amount
    from_account.save && to_account.save
  end

  ...
end
```
