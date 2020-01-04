class Api::TasksController < Api::ApplicationController
  def index
    @tasks = Task.all
  end

  def create

  end

  def edit

  end

  def update

  end

  def delete

  end

  private

  def task_params
    params.require(:task).permit(:user_id, :title, :content, :expires_at, :completion_flg)
  end
end
