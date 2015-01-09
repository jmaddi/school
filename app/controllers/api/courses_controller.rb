class Api::CoursesController < ApplicationController
  wrap_parameters Course

  def index
    @courses = Course.all
    render json: @courses
  end

  def create
    @course = Course.new(course_params)
    @course.save
    render json: @course
  end

  def show
    @course = Course.find(params[:id])
    render json: @course
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    head :no_content
  end


private
  def course_params
    params.require(:course).permit(:code, :name, :max_enrollments, :start_date)
  end
end
