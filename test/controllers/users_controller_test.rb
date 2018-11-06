# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get sign in' do
    get '/signin'
    assert_response :success
  end

  test 'should get sign up' do
    get '/signup'
    assert_response :success
  end

  test 'should not get sign out' do
    get '/signout'
    assert_response :redirect
  end
end
