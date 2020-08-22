class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:task].present?
      #if params[:task][:title].present? && params[:task][:status].present?
      #  @tasks = Task.where("title LIKE ?", '%#{params[:title]}%').where(status: params[:status])
      #elsif params[:task][:status].empty?
      # @tasks = Task.all.where("title like?", "%#{params[:task][:title]}%") できた！
      if params[:task][:title].empty?
        #@tasks = Task.where(params[status: params[:status]])
        @tasks = Task.all.where(params[:task][status: params[:status]])
      end
      #else
      #@tasks = Task.all.order(created_at: :desc)

    else
      @tasks = Task.where(title: "資源ごみ")
    end
    if params[:sort_expired]
     @tasks = Task.all.order(expired_at: :desc)
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