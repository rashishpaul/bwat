require 'pg'
require 'pry'
# this line of code provides db from server
if ENV["RACK_ENV"] == "brotha"
    conn= PG.connect(
        dbname: ENV["POSTGRES_DB"],
        host: ENV["POSTGRES_HOST"],
        password: ENV["POSTGRES_PASS"],
        user: ENV["POSTGRES_USER"]
     )
else
# this line of code provides db from computer
    conn = PG.connect(dbname: "brotha")
end

# conn.exec("DROP TABLE IF EXISTS role")
# conn.exec("DROP TABLE IF EXISTS comments")
# conn.exec("DROP TABLE IF EXISTS actors")
# conn.exec("DROP TABLE IF EXISTS movies")
# conn.exec("DROP TABLE IF EXISTS users")
# conn.exec("DROP TABLE IF EXISTS movie_actor")



# the following line of code is about table creation and seeding data
conn.exec("CREATE TABLE users(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    password       VARCHAR,
    email          VARCHAR,
    message        TEXT NOT NULL
  )"
)

conn.exec("CREATE TABLE actors(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    gender         VARCHAR,
    birthday       VARCHAR
  )"
)

conn.exec("CREATE TABLE movies(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    genre          VARCHAR,
    rating         VARCHAR,
    runtime        VARCHAR,
    director       VARCHAR
  )"
)

conn.exec("CREATE TABLE roles(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    ranking        INTEGER,
    actor_id       INTEGER REFERENCES actors(id),
    movie_id       INTEGER REFERENCES movies(id)
  )"
)


# date will automatically populated using "DATE" and "CURRENT_DATE" in the value fields
conn.exec("CREATE TABLE comments(
    id            SERIAL PRIMARY KEY,
    entry         TEXT NOT NULL,
    date          DATE,
    user_id       INTEGER REFERENCES users(id)
  )"
)


