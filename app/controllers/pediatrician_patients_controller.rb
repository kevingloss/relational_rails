class PediatricianPatientsController < ApplicationController
  def index
    @doctor = Pediatrician.find(params[:id])
    if params[:sort] == "asc"
      @babies = @doctor.patients.order(name: :asc)
    else
      @babies = @doctor.patients
    end
  end

  def new
    @doctor = Pediatrician.find(params[:id])
  end

  def create
    doctor = Pediatrician.find(params[:pediatrician_id])
    doctor.patients.create(patient_params)
    redirect_to "/pediatricians/#{doctor.id}/patients"
  end

  def sorted
    @babies = index.order(name: :asc)
    redirect_to "/pediatricians/#{index[0].pediatrician_id}/patients"
  end

  private
  
  def patient_params
    params.permit(:name, :age_in_months, :full_term_birth)
  end
end
