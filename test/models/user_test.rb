# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without fields' do
    user = User.new
    assert_not user.save
  end

  test 'check validation' do
    params = { username: 'test', name: 'test', password: 'testtest', password_confirmation: 'testtest', email: 'unti___test@test.com' }
    assert User.new(params).valid?

    params[:password_confirmation] = '321'
    assert_not User.new(params).valid?

    params[:password_confirmation] = 'testtest'
    params[:email] = 'testtest'
    assert_not User.new(params).valid?
  end

  test 'password should be secure' do
    params = { username: 'test', name: 'test', password: 'testtest', password_confirmation: 'testtest', email: 'unti___test@test.com' }
    user = User.new(params)
    assert user[:password] != params[:password]
  end
end
