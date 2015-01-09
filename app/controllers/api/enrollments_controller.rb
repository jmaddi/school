class Api::EnrollmentsController < ApplicationController
  wrap_parameters Enrollment

  def index
    @enrollments = Enrollment.all
    @enrollments = Enrollment.where(course_id: params[:course_id]) if params[:course_id]
    render json: @enrollments
  end

  def create
    @enrollment = Enrollment.new(enrollment_params)
    if @enrollment.save
      render json: @enrollment
    else
      render json: { errors: @enrollment.errors.full_messages }, status: 422
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])
    @enrollment.destroy
    head :no_content
  end

private
  def enrollment_params
    params.require(:enrollment).permit(:course_id, :student_id)
  end
end
