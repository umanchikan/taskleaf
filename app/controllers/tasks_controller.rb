class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:task].present?
      if #blank?
        @tasks = Task.where(status: params[:status])
      elsif #もし渡されたパラメータがタイトルのみだったとき
        @tasks = Task.where("title like ?" ,'%#{params[:title]}%')
      elsif #もし渡されたパラメータがステータスのみだったとき
        @tasks = Task.where(status: params[:status])
      end
    end
    if params[:sort_expired]
      @tasks = Task.all.order(expired_at: :desc)
    else
      @tasks = Task.all.order(created_at: :desc)
    end
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
    params.require(:task).permit(:title, :content, :expired_at, :status)
  end

def set_task
  @task = Task.find(params[:id])
end

end