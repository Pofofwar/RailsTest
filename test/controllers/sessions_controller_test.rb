# frozen_string_literal: true

require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should sing in' do
    post '/sessions', params: { email: 'MyString', password: 'test' }
    assert_response :success
  end
end
