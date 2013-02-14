require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { authlevel: @user.authlevel, contact1: @user.contact1, contact2: @user.contact2, contact3: @user.contact3, create_user: @user.create_user, family_kana: @user.family_kana, family_name: @user.family_name, first_kana: @user.first_kana, first_name: @user.first_name, mail1: @user.mail1, mail2: @user.mail2, mail3: @user.mail3, notice: @user.notice, pw: @user.pw, sendmail: @user.sendmail, update_user: @user.update_user }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { authlevel: @user.authlevel, contact1: @user.contact1, contact2: @user.contact2, contact3: @user.contact3, create_user: @user.create_user, family_kana: @user.family_kana, family_name: @user.family_name, first_kana: @user.first_kana, first_name: @user.first_name, mail1: @user.mail1, mail2: @user.mail2, mail3: @user.mail3, notice: @user.notice, pw: @user.pw, sendmail: @user.sendmail, update_user: @user.update_user }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
