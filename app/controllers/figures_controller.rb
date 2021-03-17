class FiguresController < ApplicationController

  get '/figures' do
    @figures=Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure=Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure=Figure.find(params[:id])
    @titles=Title.all
    @landmarks=Landmark.all
    erb :'figures/edit'
  end

  post '/figures' do
    @figure=Figure.create(params[:figure])
    @figure.title_ids = params[:figure][:title_ids]
    @figure.landmark_ids = params[:figure][:landmark_ids]

      if !params[:title][:name].empty?
        title=Title.find_or_create_by(name: params[:title][:name])
        @figure.titles << title
      end

      if !params[:landmark][:name].empty?
        landmark=Landmark.find_or_create_by(name: params[:landmark][:name])
        @figure.landmarks << landmark
      end
    end

    patch '/figures/:id' do
      @figure = Figure.find(params[:id])
      @figure.name = params[:figure][:name] unless params[:figure][:name] == ""
      @figure.title_ids = params[:figure][:title_ids] unless params[:figure][:title_ids] == ""
      @figure.landmark_ids = params[:figure][:landmark_ids] unless params[:figure][:landmark_ids] == ""
        if !params[:title][:name].empty?
          title=Title.find_or_create_by(name: params[:title][:name])
          @figure.titles << title
        end
        if !params[:landmark][:name].empty?
          landmark=Landmark.find_or_create_by(name: params[:landmark][:name])
          @figure.landmarks << landmark
        end
        @figure.save
        redirect :"/figures/#{@figure.id}"
    end
end