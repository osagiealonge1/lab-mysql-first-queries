

USE ironhack_schema;

SELECT *
FROM applestore2;

/* QUESTION 1: Which are the different genres?: */ SELECT DISTINCT prime_genre
FROM applestore2;

/* QUESTION 2: Which is the genre with more apps rated?: */ SELECT DISTINCT prime_genre, SUM(rating_count_tot) AS total_ratings
FROM applestore2
GROUP BY prime_genre
ORDER BY total_ratings DESC;

/* QUESTION 3: Which is the genre with more apps?: */ SELECT DISTINCT prime_genre, COUNT(*) AS most_apps
FROM applestore2
GROUP BY prime_genre
LIMIT 1;

/* QUESTION 4: Which is the one with less? */ SELECT DISTINCT prime_genre, COUNT(*) AS least_apps
FROM applestore2
GROUP BY prime_genre
ORDER BY least_apps ASC
LIMIT 1;

/* QUESTION 5: Take the 10 apps most rated. */ SELECT track_name, rating_count_tot
FROM applestore2
ORDER BY rating_count_tot DESC
LIMIT 10;

/* QUESTION 6: Take the 10 apps best rated by users. */ SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 10;

/* QUESTION 7: Take a look on the data you retrieved in the question 5. Give some insights.
Insights: 
1. The most rated app is a social media app.
2. The 10 most rated apps list is dominated by social media and gaming apps, followed by music apps.
*/

/* QUESTION 8: Take a look on the data you retrieved in the question 6. Give some insights.
Insights:
1.The 10 best rated apps are gaiming apps except for a food delivery app.
*/

/* QUESTION 9: Now compare the data from questions 5 and 6. What do you see?
1. The number of ratings of the top rated apps is significantly lower than the most rated apps
*/

/* QUESTION 10. How could you take the top 3 regarding the user ratings but also the number of votes? */ SELECT track_name, user_rating, rating_count_tot
FROM applestore2
ORDER BY user_rating DESC, rating_count_tot DESC
LIMIT 3;

/* QUESTION 11: Do people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion? */

/* 11.1: The genre which generated the most revenue is Games. This should informed the business team's decision to create more game-based apps*/ 
SELECT prime_genre, SUM(price) AS most_purchased_genre
FROM applestore2
GROUP BY prime_genre
ORDER by most_purchased_genre DESC;

/* 11.2: Correlation Between Price and Ratings: There isn't much of a relationship */
SELECT price, AVG(user_rating) AS average_rating
FROM applestore2
GROUP BY price
ORDER BY average_rating DESC;