class TodosController < ApplicationController

  def index
    todos = Todo.all
    render json: todos.to_json, status: 200
  end

  def show
    if params[:id] == "new"
      todo = Todo.new
      render json: todo.to_json, status: 200
    elsif Todo.exists?(params[:id])
      todo = Todo.find(params[:id])
      render json: todo.to_json, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

  def create
    #For create to work, we must *require* that a parameter is sent with the name 'task'
    if params[:task].nil? || params[:task].empty?
      err_msg = "The 'task' parameter was empty or not found"
      render json: { error_msg: err_msg }.to_json, status: 422
    else
      # todo = todo.create(task: params[:task])
      todo = Todo.new
      todo.task = params[:task]
      todo.save
      render json: todo.to_json, status: 201
    end
  end

  def update
  end

  def destroy
    if Todo.exists?(params[:id])
      todo = Todo.find(params[:id])
      todo.destroy
      render json: { message: "todo Deleted Successfully." }, status: 200
    else
      render json: { error_msg: 'Record Not Found!', id: params[:id] }.to_json, status: 404
    end
  end

end
