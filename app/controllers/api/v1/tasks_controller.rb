module Api
  module V1
    class TasksController < ApplicationController
      before_action :authenticate_user
      before_action :set_user
      before_action :set_task, only: [:show, :update, :destroy]

        # GET /api/v1/users/:user_id/tasks
      def index
        tasks = @user.tasks
        render json: tasks
      end

      # GET /api/v1/users/:user_id/tasks/:task_id
      def show
        render json: task @task
      end

      # POST /api/v1/users/:user_id/tasks
      def create
        task = @user.tasks.new(task_params)
        if task.save
          render json: task, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/users/:user_id/tasks/:task_id
      def update
        if @task.update(task_params)
          render json: task
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/users/:user_id/tasks/:task_id
      def destroy
        @task.destroy
        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:user_id])
      end

      def set_task
        @task = @user.tasks.find(params[:id])
      end

      def task_params
        params.require(:task).permit(:title, :done)
      end
    end
  end
end
