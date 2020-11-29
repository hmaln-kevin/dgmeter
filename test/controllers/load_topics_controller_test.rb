require 'test_helper'

class LoadTopicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @load_topic = load_topics(:one)
  end

  test "should get index" do
    get load_topics_url
    assert_response :success
  end

  test "should get new" do
    get new_load_topic_url
    assert_response :success
  end

  test "should create load_topic" do
    assert_difference('LoadTopic.count') do
      post load_topics_url, params: { load_topic: { description: @load_topic.description, pin: @load_topic.pin } }
    end

    assert_redirected_to load_topic_url(LoadTopic.last)
  end

  test "should show load_topic" do
    get load_topic_url(@load_topic)
    assert_response :success
  end

  test "should get edit" do
    get edit_load_topic_url(@load_topic)
    assert_response :success
  end

  test "should update load_topic" do
    patch load_topic_url(@load_topic), params: { load_topic: { description: @load_topic.description, pin: @load_topic.pin } }
    assert_redirected_to load_topic_url(@load_topic)
  end

  test "should destroy load_topic" do
    assert_difference('LoadTopic.count', -1) do
      delete load_topic_url(@load_topic)
    end

    assert_redirected_to load_topics_url
  end
end
