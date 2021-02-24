module Api
  module V1
    class TasksController < ApplicationController
      before_action :authorize_access_request!
      
      def index
        tasks = Task.where(project_id: params[:project_id])
        render(json: TaskSerializer.new(tasks).serializable_hash, status: :ok)
      end

      def show
        task = Task.find_by(id: params[:id])
        render(json: TaskSerializer.new(task).serializable_hash, status: :ok)
      end

      def create
        task = Task.new(task_params)
        if task.save
          render(json: TaskSerializer.new(task).serializable_hash, status: :created)
        else
          render(json: { errors: task.errors }, status: :unprocessable_entity)
        end
      end

      def update
        task = Task.find_by(id: params[:id])
        if task.update(task_params)
          render(json: TaskSerializer.new(task).serializable_hash, status: :created)
        else
          render(json: { errors: task.errors }, status: :unprocessable_entity)
        end
      end

      def destroy
        Task.find_by(id: params[:id]).destroy
      end

      def position
        task = Task.find_by(id: params[:task_id])
        if task.update(position: task_params[:position])
          render(json: TaskPositionSerializer.new(task), status: :created)
        else
          render(json: { errors: task.errors }, status: :unprocessable_entity)
        end
      end

      def complete
        task = Task.find_by(id: params[:task_id])
        if task.update(is_done: task_params[:is_done])
          render(json: TaskCompleteSerializer.new(task), status: :created)
        else
          render(json: { errors: task.errors }, status: :unprocessable_entity)
        end
      end

      private

      def task_params
        params.require(:task).permit(:name, :position, :is_done, :project_id)
      end
    end
  end
end
