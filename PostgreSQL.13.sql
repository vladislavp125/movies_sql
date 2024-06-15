--Создание таблицы фильмов
CREATE TABLE if NOT EXISTS Movies (
	movie_ID serial primary key,
  	title varchar(50),
  	release_date DATE,
  	genre VARCHAR(50),
  	raiting FLOAT,
  	description varchar(255)
);

--Создание таблицы актеров
CREATE TABLE if NOT EXISTS People (
	actor_ID serial primary key,
  	actor_name varchar(50),
  	actor_role VARCHAR(50)
);

--Создание таблицы для связи актеров с фильмами
CREATE TABLE if NOT EXISTS MoviePeople (
	MoviePeople_ID serial primary key,
  	movie_id int,
  	FOREIGN KEY (movie_id) REFERENCES movies(movie_id) on DELETE CASCADE,
  	actor_id int, 
  	FOREIGN KEY (actor_id) REFERENCES people(actor_id) on DELETE CASCADE
);

--Создание таблицы пользователей
CREATE TABLE if NOT EXISTS users (
	user_id serial primary key,
  	username VARCHAR(50),
  	email VARCHAR(255),
  	user_password VARCHAR(50)
);

--Создание таблицы с рецензиями
CREATE TABLE if NOT EXISTS reviews (
	reviews_id serial primary key,
  	movie_id int,
  	FOREIGN KEY (movie_id) REFERENCES movies(movie_id) on DELETE CASCADE,
  	user_id int,
  	FOREIGN KEY (user_id) REFERENCES users(user_id) on DELETE CASCADE,
  	raiting FLOAT,
  	review_text VARCHAR(255),
  	review_date DATE
);

--Создание таблицы с новостями
CREATE TABLE if NOT EXISTS News (
	News_id serial primary key,
  	title VARCHAR(50),
  	Content_news VARCHAR(255),
  	author VARCHAR(50),
  	publish_date date
);

--Зполнение тестовыми данными
insert into movies (title, release_date, genre, raiting, description)
VALUES (
  'The Shawshank Redemption', '1994-09-23', 'Drama', 9.3, 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.'),
('The Godfather', '1972-03-24', 'Crime, Drama', 9.2, 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.'),
('The Dark Knight', '2008-07-18', 'Action, Crime, Drama', 9.0, 'When the menace known as the Joker emerges from his mysterious past, he wreaks havoc and chaos on the people of Gotham.'),
('Pulp Fiction', '1994-10-14', 'Crime, Drama', 8.9, 'The lives of two mob hitmen, a boxer, a gangster, and his wife intertwine in four tales of violence and redemption.'),
('Forrest Gump', '1994-07-06', 'Drama, Romance', 8.8, 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate, and other historical events unfold through the perspective of an Alabama man with an IQ of 75.'),
('Inception', '2010-07-16', 'Action, Adventure, Sci-Fi', 8.8, 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.'),
('Fight Club', '1999-10-15', 'Drama', 8.8, 'An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into something much, much more.'),
('The Matrix', '1999-03-31', 'Action, Sci-Fi', 8.7, 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.'),
('The Lord of the Rings: The Fellowship of the Ring', '2001-12-19', 'Action, Adventure, Drama', 8.8, 'A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.'),
('Star Wars: Episode IV - A New Hope', '1977-05-25', 'Action, Adventure, Fantasy', 8.6, 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee, and two droids to save the galaxy from the Empire''s world-destroying battle station while also attempting to rescue Princess Leia from the mysterious Darth Vader.'
);

insert into people (actor_name, actor_role)
VALUES ('Tim Robbins', 'Andy Dufresne'),
('Morgan Freeman', 'Ellis Boyd "Red" Redding'),
('Marlon Brando', 'Don Vito Corleone'),
('Al Pacino', 'Michael Corleone'),
('Christian Bale', 'Bruce Wayne / Batman'),
('Heath Ledger', 'Joker'),
('John Travolta', 'Vincent Vega'),
('Samuel L. Jackson', 'Jules Winnfield'),
('Tom Hanks', 'Forrest Gump'),
('Robin Wright', 'Jenny Curran'),
('Leonardo DiCaprio', 'Dom Cobb'),
('Joseph Gordon-Levitt', 'Arthur'),
('Edward Norton', 'The Narrator'),
('Brad Pitt', 'Tyler Durden'),
('Keanu Reeves', 'Neo'),
('Laurence Fishburne', 'Morpheus'),
('Elijah Wood', 'Frodo Baggins'),
('Ian McKellen', 'Gandalf'),
('Mark Hamill', 'Luke Skywalker'),
('Harrison Ford', 'Han Solo');

INSERT INTO moviepeople (movie_id, actor_id) VALUES
((SELECT movie_id FROM movies WHERE title = 'The Shawshank Redemption'), (SELECT actor_id FROM people WHERE actor_name = 'Tim Robbins')),
((SELECT movie_id FROM movies WHERE title = 'The Shawshank Redemption'), (SELECT actor_id FROM people WHERE actor_name = 'Morgan Freeman')),
((SELECT movie_id FROM movies WHERE title = 'The Godfather'), (SELECT actor_id FROM people WHERE actor_name = 'Marlon Brando')),
((SELECT movie_id FROM movies WHERE title = 'The Godfather'), (SELECT actor_id FROM people WHERE actor_name = 'Al Pacino')),
((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT actor_id FROM people WHERE actor_name = 'Christian Bale')),
((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT actor_id FROM people WHERE actor_name = 'Heath Ledger')),
((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT actor_id FROM people WHERE actor_name = 'John Travolta')),
((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT actor_id FROM people WHERE actor_name = 'Samuel L. Jackson')),
((SELECT movie_id FROM movies WHERE title = 'Forrest Gump'), (SELECT actor_id FROM people WHERE actor_name = 'Tom Hanks')),
((SELECT movie_id FROM movies WHERE title = 'Forrest Gump'), (SELECT actor_id FROM people WHERE actor_name = 'Robin Wright')),
((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT actor_id FROM people WHERE actor_name = 'Leonardo DiCaprio')),
((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT actor_id FROM people WHERE actor_name = 'Joseph Gordon-Levitt')),
((SELECT movie_id FROM movies WHERE title = 'Fight Club'), (SELECT actor_id FROM people WHERE actor_name = 'Edward Norton')),
((SELECT movie_id FROM movies WHERE title = 'Fight Club'), (SELECT actor_id FROM people WHERE actor_name = 'Brad Pitt')),
((SELECT movie_id FROM movies WHERE title = 'The Matrix'), (SELECT actor_id FROM people WHERE actor_name = 'Keanu Reeves')),
((SELECT movie_id FROM movies WHERE title = 'The Matrix'), (SELECT actor_id FROM people WHERE actor_name = 'Laurence Fishburne')),
((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Fellowship of the Ring'), (SELECT actor_id FROM people WHERE actor_name = 'Elijah Wood')),
((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Fellowship of the Ring'), (SELECT actor_id FROM people WHERE actor_name = 'Ian McKellen')),
((SELECT movie_id FROM movies WHERE title = 'Star Wars: Episode IV - A New Hope'), (SELECT actor_id FROM people WHERE actor_name = 'Mark Hamill')),
((SELECT movie_id FROM movies WHERE title = 'Star Wars: Episode IV - A New Hope'), (SELECT actor_id FROM people WHERE actor_name = 'Harrison Ford'));

insert into users (username, email, user_password)
VALUES
('john_doe', 'john.doe@example.com', 'password123'),
('jane_smith', 'jane.smith@example.com', 'qwerty789'),
('alice_wonderland', 'alice.wonderland@example.com', 'secret456'),
('bob_jenkins', 'bob.jenkins@example.com', 'p@ssw0rd'),
('emma_brown', 'emma.brown@example.com', 'pass123'),
('michael_jackson', 'michael.jackson@example.com', 'mjkingofpop'),
('sarah_connor', 'sarah.connor@example.com', 'terminator'),
('charlie_brown', 'charlie.brown@example.com', 'peanuts'),
('lisa_simpson', 'lisa.simpson@example.com', 'thesimpsons'),
('bruce_wayne', 'bruce.wayne@example.com', 'batman'),
('tony_stark', 'tony.stark@example.com', 'ironman'),
('harry_potter', 'harry.potter@example.com', 'hogwarts'),
('hermione_granger', 'hermione.granger@example.com', 'magic'),
('luke_skywalker', 'luke.skywalker@example.com', 'theforce'),
('leia_organa', 'leia.organa@example.com', 'princess'),
('jon_snow', 'jon.snow@example.com', 'winterfell'),
('daenerys_targaryen', 'daenerys.targaryen@example.com', 'dragons'),
('clark_kent', 'clark.kent@example.com', 'superman'),
('diana_prince', 'diana.prince@example.com', 'wonderwoman');

INSERT INTO reviews (movie_id, user_id, raiting, review_text, review_date) VALUES
((SELECT movie_id FROM movies WHERE title = 'The Shawshank Redemption'), (SELECT user_id FROM users WHERE username = 'john_doe'), 5, 'Absolutely brilliant film. Loved every moment of it.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Godfather'), (SELECT user_id FROM users WHERE username = 'jane_smith'), 4, 'Classic movie with great acting and storyline.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT user_id FROM users WHERE username = 'alice_wonderland'), 5, 'One of the best superhero movies ever made.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT user_id FROM users WHERE username = 'bob_jenkins'), 4, 'Quirky and entertaining, a must-watch.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Forrest Gump'), (SELECT user_id FROM users WHERE username = 'emma_brown'), 5, 'Heartwarming and inspirational.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT user_id FROM users WHERE username = 'michael_jackson'), 5, 'Mind-bending plot with stunning visuals.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Fight Club'), (SELECT user_id FROM users WHERE username = 'sarah_connor'), 4, 'Thought-provoking and intense.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Matrix'), (SELECT user_id FROM users WHERE username = 'charlie_brown'), 5, 'Revolutionary for its time.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Fellowship of the Ring'), (SELECT user_id FROM users WHERE username = 'lisa_simpson'), 5, 'Epic fantasy adventure.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Star Wars: Episode IV - A New Hope'), (SELECT user_id FROM users WHERE username = 'bruce_wayne'), 4, 'A classic space opera.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Inception'), (SELECT user_id FROM users WHERE username = 'tony_stark'), 5, 'Intriguing concept, executed brilliantly.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Godfather'), (SELECT user_id FROM users WHERE username = 'harry_potter'), 4, 'Great storytelling and performances.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Shawshank Redemption'), (SELECT user_id FROM users WHERE username = 'hermione_granger'), 5, 'A timeless classic.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Star Wars: Episode IV - A New Hope'), (SELECT user_id FROM users WHERE username = 'luke_skywalker'), 5, 'Changed cinema forever.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Dark Knight'), (SELECT user_id FROM users WHERE username = 'leia_organa'), 5, 'A masterpiece of modern cinema.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Fight Club'), (SELECT user_id FROM users WHERE username = 'jon_snow'), 4, 'Unique and provocative.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'Pulp Fiction'), (SELECT user_id FROM users WHERE username = 'daenerys_targaryen'), 5, 'Iconic and unforgettable.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Matrix'), (SELECT user_id FROM users WHERE username = 'clark_kent'), 4, 'Ahead of its time.', '2024-06-15'),
((SELECT movie_id FROM movies WHERE title = 'The Lord of the Rings: The Fellowship of the Ring'), (SELECT user_id FROM users WHERE username = 'diana_prince'), 5, 'Captivating fantasy epic.', '2024-06-15');

INSERT INTO news (title, content_news, author, publish_date) VALUES
('New Movie Release', 'A new blockbuster movie is set to hit theaters next month. Excitement is building among fans!', 'Entertainment Weekly', '2024-06-15'),
('COVID-19 Update', 'Health officials announce new measures to combat the COVID-19 pandemic. Stay informed!', 'Health Times', '2024-06-15'),
('Tech Innovation', 'Scientists unveil groundbreaking technology that promises to revolutionize the industry.', 'Tech News Today', '2024-06-15'),
('Sports Recap', 'Recap of the latest sports events and scores from around the globe.', 'Sports Illustrated', '2024-06-15'),
('Financial Markets Report', 'Analyze the latest trends in the stock market and financial sector.', 'Financial Times', '2024-06-15');


--Получения списка всех фильмов с деталями.
SELECT 
    movies.title,
    movies.release_date,
    movies.genre,
    movies.raiting,
    movies.description,
    people.actor_name,
    people.actor_role
FROM movies
JOIN moviepeople ON movies.movie_id = moviepeople.movie_id
JOIN people ON moviepeople.actor_id = people.actor_id; 

--Поиска фильмов по жанру и дате выпуска.
SELECT 
    title,
    release_date,
    genre,
    raiting,
    description
FROM movies
WHERE 
genre = 'Drama'
AND release_date >= '1994-09-20'
AND release_date <= '1994-09-25';

--Получения списка актеров и их ролей в конкретных фильмах
SELECT actor_name, actor_role 
from people
JOIN moviepeople ON people.actor_id = moviepeople.actor_id
JOIN movies on movies.movie_id = moviepeople.movie_id
WHERE movies.title = 'The Dark Knight';

--Получения списка рецензий и оценок для конкретного фильма.
SELECT review_text, reviews.raiting from reviews
JOIN movies on reviews.movie_id = movies.movie_id
where movies.title = 'The Dark Knight';

--Добавления нового фильма, обновления его информации и удаления.
--Добавление
insert into movies (title, release_date, genre, raiting, description)
values ();
--Обновление
UPDATE movies
set description = ''
WHERE title = '';
--Удаление
delete from movies
where title = '';

--Добавления и удаления рецензий.
--добавление рецензии
insert into reviews (movie_id, user_id, raiting, review_text, review_date)
VALUES 
(SELECT movie_id FROM movies WHERE title = ''), (SELECT user_id FROM users WHERE username = ''), '', '', '');

--удаление рецензии
delete from reviews
where review_date = '';

--Создайте представления для упрощения запросов.
--Получения списка всех фильмов с деталями.
create VIEW films
as SELECT 
    movies.title,
    movies.release_date,
    movies.genre,
    movies.raiting,
    movies.description,
    people.actor_name,
    people.actor_role
FROM movies
JOIN moviepeople ON movies.movie_id = moviepeople.movie_id
JOIN people ON moviepeople.actor_id = people.actor_id; 
 
--Поиска фильмов по жанру и дате выпуска.
 create VIEW films_ganre_date 
as SELECT 
    title,
    release_date,
    genre,
    raiting,
    description
FROM movies
WHERE 
genre = 'Drama'
AND release_date >= '1994-09-20'
AND release_date <= '1994-09-25';

--Получения списка актеров и их ролей в конкретных фильмах
create view list_actor
as SELECT actor_name, actor_role 
from people
JOIN moviepeople ON people.actor_id = moviepeople.actor_id
JOIN movies on movies.movie_id = moviepeople.movie_id
WHERE movies.title = 'The Dark Knight';

--Получения списка рецензий и оценок для конкретного фильма.
CREATE view list_reviews
as SELECT review_text, reviews.raiting from reviews
JOIN movies on reviews.movie_id = movies.movie_id
where movies.title = 'The Dark Knight';

--Расширенный функционал для пользователей

create TABLE favorite_films(	
  	favoritefilm_id serial PRIMARY key,
	title VARCHAR(50),
	movie_id int,
  	FOREIGN KEY (movie_id) REFERENCES movies(movie_id) on DELETE CASCADE,
  	user_id int,
  	FOREIGN KEY (user_id) REFERENCES users(user_id) on DELETE CASCADE
);

create TABLE preferences (
	genre VARCHAR(50),
  	user_id int,
  	FOREIGN KEY (user_id) REFERENCES users(user_id) on DELETE CASCADE
);

create TABLE favorite_news(
	user_id int,
  	FOREIGN KEY (user_id) REFERENCES users(user_id) on DELETE CASCADE,
  	news_id int,
  	FOREIGN key (news_id) REFERENCES news(news_id) on DELETE CASCADE
);
--Комментарии к рецензиям
create TABLE coments_reviews(
	comment_id serial PRIMARY key,
  	comment_review TEXT,
  	comment_date DATE,
  	user_id int,
  	FOREIGN KEY (user_id) REFERENCES users(user_id) on DELETE CASCADE,
  	reviews_id int,
  	FOREIGN key (reviews_id) REFERENCES reviews(reviews_id) on DELETE CASCADE
);

--Поиск фильмов по сценаристам, композиторам и другим персонам
select 
	title,
    release_date,
    genre,
    raiting,
    description 
from movies
JOIN moviepeople ON movies.movie_id = moviepeople.movie_id
JOIN people ON moviepeople.actor_id = people.actor_id
where actor_role = 'Andy Dufresne';



