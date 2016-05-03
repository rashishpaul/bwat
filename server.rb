require "pry"
require "pg"

module Sinatra

  class Server < Sinatra::Base

    get '/'do
      erb :index
    end

    get '/about' do
      erb :about
    end

    get '/actors' do
      @actors = conn.exec('SELECT * FROM actors;')
      erb :actors
    end

    post '/actors' do
      @name = params['name']
      @birthday = params['birthday']
      @gender = params['gender']

      conn.exec_params('INSERT INTO actors (name, birthday, gender) VALUES ($1, $2, $3)', [@name, @birthday, @gender])


      # @new_actor = true

      erb :actors
    end

    # delete '/actors' do
    #   id = params['actors_id'].to_i
    #   conn.exec_params('DELETE FROM actors WHERE id = $1',[id])
    #   redirect to('/actors')
    # end

    # put '/actors' do
    #   id = params['actors_id'].to_i
    #   @name = params['name']
    #   @birthday = params['birthday']
    #   conn.exec_params('UPDATE actors SET name = $1, birthday = $2 WHERE id = $3',[name, birthday, id])
    #   redirect to('/actors')
    # end


    get "/movies" do
      @movies = conn.exec("SELECT * FROM movies;")
      erb :movies
    end

      def conn
        PG.connect(dbname: 'brotha')
      end
  end #ends the class
end #ends the module
