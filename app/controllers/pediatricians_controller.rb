class PediatriciansController < ApplicationController
  def index
    @doctors = Pediatrician.all
  end
end
