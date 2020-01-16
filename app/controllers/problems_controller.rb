require './config/environment'

class ProblemsController < ApplicationController
  # CREATE
  get '/problems/new' do
    @colors = ["white", "red", "orange", "yellow", "green", "lime", "blue", "pink", "purple", "black"]
    @styles = ["dyno", "crimps", "jugs", "slopers", "pinches", "body tension", "compressions", "powerful", "overhang", "dihedral", "slab"]
    # @styles = Style.all
    erb :'problems/new'
  end

  post '/problems' do
    binding.pry
    params[:problem][:color]
    params[:problem][:grade]
    params[:problem][:image]
    params[:problem][:style][:name]
    @problem = Problem.new(params)
  end
  # UPDATE

  # DELETE
end