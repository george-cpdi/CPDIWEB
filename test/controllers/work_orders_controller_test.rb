require "test_helper"

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order = work_orders(:one)
  end

  test "should get index" do
    get work_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_work_order_url
    assert_response :success
  end

  test "should create work_order" do
    assert_difference('WorkOrder.count') do
      post work_orders_url, params: { work_order: { complete_date_and_time: @work_order.complete_date_and_time, description_of_issue: @work_order.description_of_issue, email: @work_order.email, issue: @work_order.issue, level_of_issue: @work_order.level_of_issue, line: @work_order.line, location: @work_order.location, machine: @work_order.machine, planned_date_and_time: @work_order.planned_date_and_time, request_date_time: @work_order.request_date_time, requested_by: @work_order.requested_by, type: @work_order.type } }
    end

    assert_redirected_to work_order_url(WorkOrder.last)
  end

  test "should show work_order" do
    get work_order_url(@work_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_work_order_url(@work_order)
    assert_response :success
  end

  test "should update work_order" do
    patch work_order_url(@work_order), params: { work_order: { complete_date_and_time: @work_order.complete_date_and_time, description_of_issue: @work_order.description_of_issue, email: @work_order.email, issue: @work_order.issue, level_of_issue: @work_order.level_of_issue, line: @work_order.line, location: @work_order.location, machine: @work_order.machine, planned_date_and_time: @work_order.planned_date_and_time, request_date_time: @work_order.request_date_time, requested_by: @work_order.requested_by, type: @work_order.type } }
    assert_redirected_to work_order_url(@work_order)
  end

  test "should destroy work_order" do
    assert_difference('WorkOrder.count', -1) do
      delete work_order_url(@work_order)
    end

    assert_redirected_to work_orders_url
  end
end
