require "test_helper"

class FlexTemplatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flex_template = flex_templates(:one)
  end

  test "should get index" do
    get flex_templates_url
    assert_response :success
  end

  test "should get new" do
    get new_flex_template_url
    assert_response :success
  end

  test "should create flex_template" do
    assert_difference('FlexTemplate.count') do
      post flex_templates_url, params: { flex_template: { body: @flex_template.body, name: @flex_template.name } }
    end

    assert_redirected_to flex_template_url(FlexTemplate.last)
  end

  test "should show flex_template" do
    get flex_template_url(@flex_template)
    assert_response :success
  end

  test "should get edit" do
    get edit_flex_template_url(@flex_template)
    assert_response :success
  end

  test "should update flex_template" do
    patch flex_template_url(@flex_template), params: { flex_template: { body: @flex_template.body, name: @flex_template.name } }
    assert_redirected_to flex_template_url(@flex_template)
  end

  test "should destroy flex_template" do
    assert_difference('FlexTemplate.count', -1) do
      delete flex_template_url(@flex_template)
    end

    assert_redirected_to flex_templates_url
  end
end
