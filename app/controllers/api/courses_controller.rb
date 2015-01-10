class Api::CoursesController < ApplicationController
  wrap_parameters Course

  def index
    @courses = Course.all
    render json: @courses.to_json(methods: [ :total_enrollments ])
  end

  def create
    @course = Course.new(course_params)
    @course.save
    if @course.save
      render json: @course.to_json(methods: [ :total_enrollments ])
    else
      render json: { errors: @course.errors.full_messages }, status: 422
    end
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
