class PagesController < ApplicationController
  def home
    @todo_lists = TodoList.all
  end

  def about
  end
end
