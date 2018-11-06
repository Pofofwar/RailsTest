# frozen_string_literal: true

require 'test_helper'

class StockControllerTest < ActionDispatch::IntegrationTest
  test 'should not get list stock' do
    get '/stocks'
    assert_response :redirect
  end

  test 'should not get new stock' do
    get '/stocks/new'
    assert_response :redirect
  end

  test 'should not get details stock' do
    get "/stocks/#{Stock.first.id}"
    assert_response :redirect
  end
end
