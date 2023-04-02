require "test_helper"

class AlertsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alert = alerts(:one)
  end

  test "should get index" do
    get alerts_url
    assert_response :success
  end

  test "should get new" do
    get new_alert_url
    assert_response :success
  end

  test "should create alert" do
    assert_difference("Alert.count") do
      post alerts_url, params: { alert: { description: @alert.description, name: @alert.name, origin: @alert.origin, tag: @alert.tag, task_id: @alert.task_id, type: @alert.type } }
    end

    assert_redirected_to alert_url(Alert.last)
  end

  test "should show alert" do
    get alert_url(@alert)
    assert_response :success
  end

  test "should get edit" do
    get edit_alert_url(@alert)
    assert_response :success
  end

  test "should update alert" do
    patch alert_url(@alert), params: { alert: { description: @alert.description, name: @alert.name, origin: @alert.origin, tag: @alert.tag, task_id: @alert.task_id, type: @alert.type } }
    assert_redirected_to alert_url(@alert)
  end

  test "should destroy alert" do
    assert_difference("Alert.count", -1) do
      delete alert_url(@alert)
    end

    assert_redirected_to alerts_url
  end
end
