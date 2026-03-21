module Api
  module V1
    class TasksController < ApplicationController
      # GET /tasks
      def index
        tasks = Task.all
        render json: tasks
      end

      # GET /tasks/:id
      def show
        task = Task.find(params[:id])
        render json: task
      end

      # POST /tasks
      def create
        task = Task.new(task_params)
        if task.save
          render json: task, status: :created
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /task/:id
      def update
        task = Task.find(params[:id])
        if task.update(task_params)
          render json: task
        else
          render json: task.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tasks/:id
      def destroy
        task = Task.find(params[:id])
        task.destroy
        head :no_content
      end

      private

      def task_params
        params.require(:task).permit(:title, :done)
      end
    end
  end
end
