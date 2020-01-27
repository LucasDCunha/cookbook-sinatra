require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require_relative 'cookbook'
require_relative 'recipe'
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

COOKBOOK = Cookbook.new('recipes.csv')

get '/' do
  @recipes = COOKBOOK.all
  erb :index
end

get '/new_rec' do
  COOKBOOK.add_recipe(Recipe.new(@params[:name], @params[:description], @params[:time], @params[:dif]))
  erb :new_rec
end
