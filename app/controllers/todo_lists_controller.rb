class TodoListsController < ApplicationController
  before_action :set_todo_list, only: %i[ show edit update destroy ]
  before_action :page_count, only: %i[ index ]
  # GET /todo_lists or /todo_lists.json
  def index
    @count.count += 1
    @count.save
    # @todo_lists = TodoList.all
    @todo_lists = TodoList.all
    @tasks_undone = TodoItem.where(completed: false)
  end

  # GET /todo_lists/1 or /todo_lists/1.json
  def show
    @todo_item = TodoItem.new
    @completed_items = @todo_list.todo_items.completed
    @list_items = @todo_list.todo_items.all.order("completed ASC")
  end

  # GET /todo_lists/new
  def new
    @todo_list = TodoList.new
  end

  # GET /todo_lists/1/edit
  def edit
  end

  # POST /todo_lists or /todo_lists.json
  def create
    @todo_list = TodoList.new(todo_list_params)

    respond_to do |format|
      if @todo_list.save
        format.html { redirect_to @todo_list, notice: "Todo list was successfully created." }
        format.json { render :show, status: :created, location: @todo_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /todo_lists/1 or /todo_lists/1.json
  def update
    respond_to do |format|
      if @todo_list.update(todo_list_params)
        format.html { redirect_to @todo_list, notice: "Todo list was successfully updated." }
        format.json { render :show, status: :ok, location: @todo_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_lists/1 or /todo_lists/1.json
  def destroy
    @todo_list.destroy
    respond_to do |format|
      format.html { redirect_to todo_lists_url, notice: "Todo list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_list
      @todo_list = TodoList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end

    def page_count
      @count = PageCount.first
    end
end
