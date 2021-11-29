require "application_system_test_case"

class TodoItemsTest < ApplicationSystemTestCase
  setup do
    @todo_item = todo_items(:one)
  end

  test "visiting the index" do
    visit todo_items_url
    assert_selector "h1", text: "Todo Items"
  end

  test "creating a Todo item" do
    visit todo_items_url
    click_on "New Todo Item"

    fill_in "Completed at", with: @todo_item.completed_at
    fill_in "Notes", with: @todo_item.notes
    fill_in "Response", with: @todo_item.response
    fill_in "Task", with: @todo_item.task
    fill_in "Todo list", with: @todo_item.todo_list_id
    fill_in "User", with: @todo_item.user_id
    click_on "Create Todo item"

    assert_text "Todo item was successfully created"
    click_on "Back"
  end

  test "updating a Todo item" do
    visit todo_items_url
    click_on "Edit", match: :first

    fill_in "Completed at", with: @todo_item.completed_at
    fill_in "Notes", with: @todo_item.notes
    fill_in "Response", with: @todo_item.response
    fill_in "Task", with: @todo_item.task
    fill_in "Todo list", with: @todo_item.todo_list_id
    fill_in "User", with: @todo_item.user_id
    click_on "Update Todo item"

    assert_text "Todo item was successfully updated"
    click_on "Back"
  end

  test "destroying a Todo item" do
    visit todo_items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Todo item was successfully destroyed"
  end
end
