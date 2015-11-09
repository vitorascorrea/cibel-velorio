require 'test_helper'

class FormulariosControllerTest < ActionController::TestCase
  test "should get selecao_velorio" do
    get :selecao_velorio
    assert_response :success
  end

  test "should get filtro_salas" do
    get :filtro_salas
    assert_response :success
  end

  test "should get confirmacao_reserva" do
    get :confirmacao_reserva
    assert_response :success
  end

end
