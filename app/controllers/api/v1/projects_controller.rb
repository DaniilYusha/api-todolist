module Api
  module V1
    class ProjectsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_project, only: [:show, :update, :destroy]

      def index
        @projects = current_user.projects
        render json: ProjectSerializer.new(@projects).serializable_hash, status: :ok
      end

      def show
        # project = Project.includes(:tasks).find_by(id: params[:id])
        render json: ProjectSerializer.new(@project).serializable_hash, status: :ok
      end

      def create
        @project = current_user.projects.build(project_params)
        if @project.save
          render(json: ProjectSerializer.new(@project).serializable_hash, status: :created)
        else
          render(json: { errors: @project.errors }, status: :unprocessable_entity)
        end
      end

      def update
        project = Project.find_by(id: params[:id])
        if project.update(project_params)
          render(json: ProjectSerializer.new(project).serializable_hash, status: :created)
        else
          render(json: { errors: project.errors }, status: :unprocessable_entity)
        end
      end

      def destroy
        Project.find_by(id: params[:id]).destroy
      end

      private

      def project_params
        params.require(:project).permit(:name)
      end

      def set_project
        @project = current_user.projects.find_by(id: params[:id])
      end
    end
  end
end
