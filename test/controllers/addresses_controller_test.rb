# frozen_string_literal: true

require 'test_helper'

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get addresses_new_url
    assert_response :success
  end

  test 'should get create' do
    get addresses_create_url
    assert_response :success
  end

  test 'should get edit' do
    get addresses_edit_url
    assert_response :success
  end

  test 'should get update' do
    get addresses_update_url
    assert_response :success
  end

  test 'should get destory' do
    get addresses_destory_url
    assert_response :success
  end
end
