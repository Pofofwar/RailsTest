# frozen_string_literal: true

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  test 'should not save stock without fields' do
    stock = Stock.new
    assert_not stock.save
  end

  test 'check validation' do
    params = { name: 'test', unit_price: 12, interest: 10, duration_in_years: 5, user_id: User.first.id }
    assert Stock.new(params).valid?

    params[:duration_in_years] = 12
    assert_not Stock.new(params).valid?

    params[:duration_in_years] = 5
    params[:interest] = 102
    assert_not Stock.new(params).valid?

    params[:interest] = 30
    params[:user_id] = -1
    assert_not Stock.new(params).valid?
  end
end
