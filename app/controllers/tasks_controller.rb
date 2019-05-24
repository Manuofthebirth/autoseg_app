class TasksController < ApplicationController
  
  def index
    @tasks = Task.all.where(isprivate: false)
  end

end
