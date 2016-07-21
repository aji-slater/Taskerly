class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
  end

  def update
    task = Task.find(params[:id])
    return unless task.update!(task_params)
    render nothing: true
  end

  private

  def task_params
    params.require(:task).permit(:id, :state, :name)
  end
end
