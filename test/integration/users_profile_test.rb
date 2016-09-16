require 'test_helper'

class UsersProfileTest < ActionDispatch::IntegrationTest
  include ApplicationHelper

  def setup
    @user = users(:michael)
  end

  test "profile display" do
    get user_path(@user)
    assert_template 'users/show'
    assert_select 'title', page_title(@user.name)
    assert_select 'h1', text: @user.name
    #assert_select 'div.pagination', count: 1
  end
end