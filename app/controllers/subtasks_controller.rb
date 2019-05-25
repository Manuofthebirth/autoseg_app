class SubtasksController < ApplicationController
  before_action :find_task
  before_action :find_subtask, except: [:create]

  def create
    @subtask = @task.subtasks.create(subtask_params)
    redirect_to @task
  end

  def destroy
    @subtask.destroy
    redirect_to @task
  end

  def complete
    @subtask.update_attribute(:completed_at, Time.now)
    redirect_to @task
  end

  private

  def subtask_params
    params[:subtask].permit(:title)
  end

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_subtask
    @subtask = @task.subtasks.find(params[:id])
  end
end
