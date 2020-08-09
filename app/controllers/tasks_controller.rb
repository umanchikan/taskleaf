class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    if params[:back]
      @task = Task.new(task_params)
    else
      @task = Task.new
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: '削除できました.'
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to @task, notice: '登録できました'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: '編集できました'
    else
      render :edit
    end
  end


  private
  def task_params
    params.require(:task).permit(:title, :content)
  end

def set_task
  @task = Task.find(params[:id])
end

end