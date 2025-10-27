require "test_helper"

class BorrowersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @borrower = borrowers(:one)
  end

  test "should get index" do
    get borrowers_url, as: :json
    assert_response :success
  end

  test "should create borrower" do
    assert_difference("Borrower.count") do
      post borrowers_url, params: { borrower: { email: @borrower.email, id_card_number: @borrower.id_card_number, name: @borrower.name } }, as: :json
    end

    assert_response :created
  end

  test "should show borrower" do
    get borrower_url(@borrower), as: :json
    assert_response :success
  end

  test "should update borrower" do
    patch borrower_url(@borrower), params: { borrower: { email: @borrower.email, id_card_number: @borrower.id_card_number, name: @borrower.name } }, as: :json
    assert_response :success
  end

  test "should destroy borrower" do
    assert_difference("Borrower.count", -1) do
      delete borrower_url(@borrower), as: :json
    end

    assert_response :no_content
  end
end
