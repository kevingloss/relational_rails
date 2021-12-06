class PatientsController < ApplicationController
  def index
    @patients = Patient.full_term?
  end

  def show
    @baby = Patient.find(params[:id])
  end

  def edit
    @baby = Patient.find(params[:id])
  end

  def update
    @baby = Patient.find(params[:id])
    @baby.update(patient_params)
    redirect_to "/patients/#{@baby.id}"
  end

  private

  def patient_params
    params.permit(:name, :age_in_months, :full_term_birth)
  end
end
