class TodosController < ApplicationController

  def index
    todos = Todo.all
    render json: todos.to_json, status: 200
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

end
