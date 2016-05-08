require 'test_helper'

class LotesControllerTest < ActionController::TestCase
  setup do
    @lote = lotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lote" do
    assert_difference('Lote.count') do
      post :create, lote: { preco: @lote.preco, qtd_lote: @lote.qtd_lote, t_lote: @lote.t_lote }
    end

    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should show lote" do
    get :show, id: @lote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lote
    assert_response :success
  end

  test "should update lote" do
    patch :update, id: @lote, lote: { preco: @lote.preco, qtd_lote: @lote.qtd_lote, t_lote: @lote.t_lote }
    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should destroy lote" do
    assert_difference('Lote.count', -1) do
      delete :destroy, id: @lote
    end

    assert_redirected_to lotes_path
  end
end
