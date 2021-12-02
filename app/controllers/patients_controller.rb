class PatientsController < ApplicationController
  def index
    @patients = Patient.all
  end

  def show
    @baby = Patient.find(params[:id])
  end
end
