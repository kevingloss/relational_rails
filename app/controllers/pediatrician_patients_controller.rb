class PediatricianPatientsController < ApplicationController
  def index
    @doctor = Pediatrician.find(params[:id])
    @babies = @doctor.patients
  end

  def new
    @doctor = Pediatrician.find(params[:id])
  end

  def create
    #require "pry"; binding.pry
    doctor = Pediatrician.find(params[:pediatrician_id])
    doctor.patients.create(patient_params)
    redirect_to "/pediatricians/#{doctor.id}/patients"
  end

  def patient_params
    params.permit(:name, :age_in_months, :full_term_birth)
  end
end
