class PediatriciansController < ApplicationController
  def index
    @doctors = Pediatrician.all
    #require "pry"; binding.pry
  end

  def show
    @doctor = Pediatrician.find(params[:id])
  end
end
