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

  private

  def subtask_params
    params[:subtask].permit(:title, :deadline_date)
  end

  def find_task
    @task = TodoList.find(params[:todo_list_id])
  end

  def find_subtask
    @subtask = @task.todo_items.find(params[:id])
  end
end
