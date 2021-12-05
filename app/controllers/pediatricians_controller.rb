class PediatriciansController < ApplicationController
  def index
    @doctors = Pediatrician.all
  end

  def new
  end

  def edit
    @doctor = Pediatrician.find(params[:id])
  end

  def create
    @doctor = Pediatrician.create(pediatrician_params)
    redirect_to '/pediatricians'
  end

  def update
    #require "pry"; binding.pry
    @doctor = Pediatrician.find(params[:id])
    @doctor.update(edit_pediatrician_params)
    redirect_to "/pediatricians/#{@doctor.id}"
  end

  def show
    @doctor = Pediatrician.find(params[:id])
  end

  def pediatrician_params
    params.permit(:name, :office, :years_practicing, :accepting_patients)
  end

  def edit_pediatrician_params
    params.permit(:office, :years_practicing, :accepting_patients)
  end
end
