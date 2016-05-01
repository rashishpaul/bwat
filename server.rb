require "pry"
require "pg"

module Sinatra

  class Server < Sinatra::Base
    conn = PG.connect(dbname: "brotha")

    get "/"do
      erb :index
    end

    get "/about" do
      erb :about
    end

    get "/actors" do
      @actors = conn.exec("SELECT * FROM actors;")
      erb :actors
    end

    post "/actors" do
      @name = params[:name]
      @birthday = params[:birthday]
      @gender = params[:gender]

      conn.exec_params("INSERT INTO actors (name, birthday, gender) VALUES ($1, $2, $3)", [@name, @birthday, @gender])

      "New Actor added."

    get "/movies" do
      @movies = conn.exec("SELECT * FROM movies;")
      erb :movies
    end

  end #ends the class
end #ends the module
