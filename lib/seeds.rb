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

conn.exec("INSERT INTO users (name, password, email, message) VALUES(
    'Bryan',
    'p@55word',
    'bryan.mytko@generalassemb.ly',
    'This is a test message from the seeded data.'
  )"
)


conn.exec("INSERT INTO actors (name, gender, birthday) VALUES (
    'Denzel Washington',
    'M',
    '06/28/1954'
  )"
)


conn.exec("INSERT INTO movies (name, genre, rating, runtime, director) VALUES (
     'Training Day',
     'drama',
     'R',
     '122 min',
     'Antoine Fuqua'
     )"
)


conn.exec("INSERT INTO roles (name, ranking, actor_id, movie_id) VALUES (
    'Alonzo Harris',
    8,
    1,
    1
    )"
)


conn.exec("INSERT INTO comments (entry, date, user_id) VALUES (
    'I think this forum is amazing!',
    CURRENT_DATE,
    1)"
)
