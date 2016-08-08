class PagesController < ApplicationController
  def index
    @people = Person.all
    @buildings = Building.all
  end
end
