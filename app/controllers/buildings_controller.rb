class BuildingsController < ApplicationController
  include ApplicationHelper

  # GET /building/new
  def new
  end

  # GET /building/create
  def create

    if params[:file]
      return redirect_to new_building_path, notice: "Vous devez importés un fichier au format csv."  unless file_extension(params[:file])
      Building.import(Building, params[:file])
      redirect_to root_path, notice: 'Vos Building sont importer.' and return
    else
      redirect_to new_building_path, notice: "Vous n'avez pas aucun fichier à uploader." and return
    end
  end
end
