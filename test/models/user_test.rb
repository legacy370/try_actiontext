require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'requires a last name' do
    my_user = User.new(first_name: 'Tony', last_name: '')
    assert_not(my_user.save)
  end
end
