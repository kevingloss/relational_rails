class PediatricianPatientsController < ApplicationController
  def index
    @doctor = Pediatrician.find(params[:id])
    @babies = @doctor.patients 
  end
end
