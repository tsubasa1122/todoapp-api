class Api::TasksController < Api::ApplicationController
  before_action :set_task, only: %i[show edit update]

  def index
    @tasks = Task.incomplete.where(user_id: current_user.id)
  end

  def show
  end

  def create
    tag = Tag.find_or_create_by(name: params[:tags_attributes][:name])
    task = Task.new(task_params)
    task.task_tags.build(tag_id: tag.id)
    if task.save
      render 'api/success'
    else
      render 'api/error'
    end
  end

  def edit
  end

  def update
    if task.update(task_params)
      render 'api/success'
    else
      render 'api/error'
    end
  end

  def destroy
    task = Task.find(params[:id])
    task.completion_flg = true
    task.save
    render 'api/success'
  end

  private

  def task_params
    params.require(:task).permit(:title, :content, :expires_at, :completion_flg, tags_attributes:[:name]).merge(user_id: @current_user.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
