class PeopleController < ApplicationController
  # before_action :set_person, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/new
  def new
  end

  # POST /people
  def create
    if params[:file]
      return redirect_to new_person_path, notice: "Vous devez importés un fichier au format csv."  unless file_extension(params[:file])
      Person.import(Person, params[:file])
      redirect_to root_path, notice: 'Les personnes sont bien importées.' and return
    else
      redirect_to new_person_path, notice: "Vous n'avez pas aucun fichier à uploader." and return
    end
  end

  private
    # def set_person
    #   @person = Person.find(params[:id])
    # end

    def person_params
      params.require(:person).permit(:reference, :person, :email, :home_phone_number, :mobile_phone_number, :firstname, :lastname, :address)
    end
end
