class PediatriciansController < ApplicationController
  def index
    @doctors = Pediatrician.all
  end

  def new
  end

  def create
    doctor = Pediatrician.create(pediatrician_params)
    redirect_to '/pediatricians'
  end

  def show
    @doctor = Pediatrician.find(params[:id])
  end

  def pediatrician_params
    params.permit(:name, :office, :years_practicing, :accepting_patients)
  end
end
