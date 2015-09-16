class TodosController < ApplicationController

  def index
    todos = Todo.all
    render json: todos.to_json, status: 200
  end

  def show
    if Todo.exists?(params[:id])
      todo = Todo.find(params[:id])
      render json: todo.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
  end

  def update
  end

  def destroy
  end

end
