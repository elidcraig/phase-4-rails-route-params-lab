class StudentsController < ApplicationController

  def index
    unless params[:name]
      students = Student.all
      render json: students
    else
      params_name = params[:name].capitalize
      student = Student.where ["last_name = ? or first_name = ?", params_name, params_name]
      # student = Student.where(first_name: params[:name]).or(Student.where(last_name: params[:name]))
      render json: student
    end    
  end

  def show
    student = Student.find params[:id]
    render json: student
  end

end
