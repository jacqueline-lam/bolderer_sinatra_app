require './config/environment'

class ProblemsController < ApplicationController
  # CREATE
  get '/problems/new' do
    @colors = ["white", "red", "orange", "yellow", "green", "lime", "blue", "pink", "purple", "black"]
    @styles = ["dyno", "crimps", "slopers", "pinches", "body tension", "compressions", "powerful", "overhang", "dihedral", "slab"]
    # @styles = Style.all
    erb :'problems/new'
  end

  # UPDATE

  # DELETE
end