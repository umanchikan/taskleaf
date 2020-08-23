class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    if params[:task].present?
      if params[:task][:title].present? && params[:task][:status].present?
        @tasks = Task.page(params[:page]).search_title(params[:task][:title]).search_status(params[:task][:status])
      elsif params[:task][:status].empty?
        @tasks = Task.page(params[:page]).search_title(params[:task][:title])
      elsif params[:task][:title].empty?
        @tasks = Task.page(params[:page]).search_status(params[:task][:status])
      end
    else
      @tasks = Task.page(params[:page])
    end
    if params[:sort_expired]
     @tasks = Task.all.page(params[:page]).order(expired_at: :asc)
    end
    if params[:sort_priority]
      @tasks = Task.all.page(params[:page]).order(priority: :desc)
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
    params.require(:task).permit(:title, :content, :expired_at, :status, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  end