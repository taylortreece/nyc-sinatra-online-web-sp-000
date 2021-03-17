class FiguresController < ApplicationController

  get '/figures/new' do
    @figures=Figure.all
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]

      if !params[:title][:name].empty?
        @figure.title_ids << Title.find_or_create_by(name: params[:title][:name]).save.id
      end

      if !params[:landmark][:name].empty?
        @figure.landmark_ids << Landmark.find_or_create_by(name: params[:landmark][:name]).save.id
      end

    @figure.save

    redirect "/figures/#{@figure.id}"
  end

end
