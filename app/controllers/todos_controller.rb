class TodosController < ApplicationController
  include Swagger::TodosApi

  before_action :set_todo, only: [:show, :update, :destroy, :star, :unstar, :done, :undone]

  # GET /todos
  def index
    @todos = Todo.all

    render json: @todos
  end

  # GET /todos/1
  def show
    render json: @todo
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
  end

  # PUT /todos/1/star
  def star
    params[:todo] = {
      star: true,
    }
    self.update
  end

  # PUT /todos/1/unstar
  def unstar
    params[:todo] = {
      star: false,
    }
    self.update
  end

  # PUT /todos/1/done
  def done
    params[:todo] = {
      done: true,
    }
    self.update
  end

  # PUT /todos/1/undone
  def undone
    params[:todo] = {
      done: false,
    }
    self.update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo
      @todo = Todo.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def todo_params
      params.require(:todo).permit(:name, :memo, :star, :done, :due_date)
    end
end
