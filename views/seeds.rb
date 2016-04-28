require 'pg'
require 'pry'

if ENV["RACK_ENV"] == "production"
    conn = PG.connect(
        dbname: ENV["POSTGRES_DB"],
        host: ENV["POSTGRES_HOST"],
        password: ENV["POSTGRES_PASS"],
        user: ENV["POSTGRES_USER"]
     )
else
    conn = PG.connect(dbname: "portfolio")
end

conn.exec("DROP TABLE IF EXISTS user_data")

conn.exec("CREATE TABLE user_data(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    email          VARCHAR,
    message        TEXT NOT NULL
  )"
)

conn.exec("INSERT INTO contact_data (name, email, message) VALUES (
    'Bryan',
    'bryan.mytko@generalassemb.ly',
    'This is a test message from the seeded data'
  )"
)

conn.exec("DROP TABLE IF EXISTS actor_data")

conn.exec("CREATE TABLE actor_data(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    gender         VARCHAR,
    birthday       INTEGER
    )"
)

conn.exec("INSERT INTO actor_data (name, gender, birthday) VALUES (
    'Denzel Washington',
    'M',
    '06/28/1954'
  )"
)

conn.exec("DROP TABLE IF EXISTS movie_data")

conn.exec("CREATE TABLE movie_data(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    genre          VARCHAR,
    rating         VARCHAR,
    runtime        INTEGER,
    director       VARCHAR
    )"
)

conn.exec("DROP TABLE IF EXISTS role")

conn.exec("CREATE TABLE role(
    id             SERIAL PRIMARY KEY,
    name           VARCHAR,
    ranking        INTEGER,
    actor_data     INTEGER REFERENCES actor_data(id),
    movie_data     INTEGER REFERECNES movie_data(id)
    )"
)

conn.exec("DROP TABLE IF EXISTS topics")

conn.exec("CREATE TABLE topics(
    id             SERIAL PRIMARY,
    date           INTEGER,
    title          VARCHAR,
    entry          VARCHAR,
    user_data      VARCHAR REFERENCES user_data
    )"
)

conn.exec("DROP TABLE IF EXISTS comments")

conn.exec("CREATE TABLE comments(
    id            SERIAL PRIMARY,
    entry         VARCHAR,
    date          INTEGER,
    user_data     VARCHAR REFERENCES user_data
    )"
)
