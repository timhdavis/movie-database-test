require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid_user_1)
  end

  test "valid user" do
    assert @user.valid?
  end

  test "invalid user without email" do
    @user.email = nil
    refute @user.valid?, 'saved user without email'
    assert_not_nil @user.errors[:name], 'no validation error for email present'
  end

end
