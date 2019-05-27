class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all.where(isprivate: false)
  end

  def personal_index
    @tasks = Task.where(:user_id => current_user.id)
  end


  def show
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    @task.save
    if @task.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  # def update
  #   if @task.update(task_params)
  #     redirect_to task_path(@task)
  #   else
  #     render 'edit'
  #   end
  # end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Atualização feita com sucesso' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  def favorite_index
    @tasks = Task.all.where(isfavorite: true)
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :isprivate, :isfavorite)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
