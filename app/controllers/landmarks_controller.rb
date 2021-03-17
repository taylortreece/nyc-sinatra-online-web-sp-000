class LandmarksController < ApplicationController

  get '/landmarks/new' do
    @figures=Figure.all

    erb :'landmarks/new'
  end

  get '/landmarks' do
    @landmarks=Landmark.all
    erb :'landmarks/index'
  end

  get '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    @landmarks=Landmark.all
    erb :'landmarks/show'
  end

  post '/landmarks' do
    landmark=Landmark.create(params[:landmark])

    redirect :"/landmarks"
  end

  get '/landmarks/:id/edit' do
    @landmark=Landmark.find(params[:id])
    @titles=Title.all
    @figues=Figure.all
    erb :'landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark=Landmark.find(params[:id])
    @landmark.name=params[:landmark][:name]
    @landmark.year_completed=params[:landmark][:year_completed]

    @landmark.save

    redirect :"/landmarks/#{@landmark.id}"
  end

end
