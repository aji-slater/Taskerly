class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def update
    task = Task.find(params[:id])
    if task.update!(task_params)
      render nothing: true
    end
  end

  private

  def task_params
    params.require(:task).permit(:id, :state, :name)
  end
end
