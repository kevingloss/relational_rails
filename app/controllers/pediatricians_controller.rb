class PediatriciansController < ApplicationController
  def index
    @doctors = Pediatrician.all
  end

  def show
    @doctor = Pediatrician.find(params[:id])
  end
end
