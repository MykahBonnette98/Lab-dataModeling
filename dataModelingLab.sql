/*We want to create a recipe creating/sharing and grocery list app. You’ll be planning out what tables we’ll need, what information they’ll store, and how the data will relate to each other.

Features
-users can sign into the app with their email and password 
-users can create recipes with ingredients and instructions
-recipes can be marked as public or private
-users can view other people’s recipes
-ingredients from recipes can be added to user’s grocery lists
-users can create their own occasions and assign recipes to occasions

-BRAINSTORMING-

-TABLES-
-User
-User password
-User Post
-Follow
-Grocery 
-Comments
-Occasions

-TABLES IDEAS-

USER                    
-User_id
-Email
-Password
-username

USER_PASSWORD
-User_password_id
-User_id
-password
-Users Recipes/post
-Users recipes id
-User id for recipes
-User text content
-User id comments
-Shareable
-Visibility 

FOLLOW
-Following_id
-Followers_id

GROCERY
-grocery_id
-Ingredients 
-Recipe 

COMMENTS
-Comment_id
-Comment text content
-User_id
-Post_id

OCCASION
-Occasion_id
-Occasions user id
-User id

POSTS
-posts_id
-user id 
-user post text content
-recipe text content
-shareable 

-RELATIONSHIPS-
One-To-One
-User id => User Password

One-To-Many
-User => Recipes
-Recipes => Grocery list
-User => comments
-User => post

Many-To-Many
-Follower => Following
-User => Occasion
-Occasions => post
*/
-TABLE CODES-

CREATE TABLE users(
user_id SERIAL PRIMARY KEY,
Username VARCHAR(50),
email VARCHAR(50)
);
CREATE TABLE password(
password_id SERIAL PRIMARY KEY,
users_id INT NOT NULL REFERENCES users(user_id),
 password VARCHAR(50)
);
CREATE TABLE posts(
post_id SERIAL PRIMARY KEY,
user_post_id INT NOT NULL REFERENCES users(user_id),
post_text VARCHAR(10000),
recipe_id VARCHAR(10000)  
);
CREATE TABLE comments(
comment_id SERIAL PRIMARY KEY,
users_id INT NOT NULL REFERENCES users(user_id),
post_id INT NOT NULL REFERENCES users(user_id), 
comment_text VARCHAR(100)
);
CREATE TABLE follow(
  follow_id SERIAL PRIMARY KEY,
  follower_id INT NOT NULL REFERENCES users(user_id),
  following_id INT NOT NULL REFERENCES users(user_id)
);
CREATE TABLE occasion(
  occasion_id SERIAL PRIMARY KEY,
  occasion_name VARCHAR(50),
  private BOOL
);
CREATE TABLE grocery(
 grocery_id SERIAL PRIMARY KEY,
 grocery_ingredients_id VARCHAR(1000),
 grocery_recipes VARCHAR(10000) 
);
CREATE TABLE occasion_users(
  occasion_user_id SERIAL PRIMARY KEY,
  group_id INT NOT NULL REFERENCES occasion(occasion_id),
  user_id INT NOT NULL REFERENCES users(user_id)
);
CREATE TABLE group_posts(
  group_post_id SERIAL PRIMARY KEY,
  group_posts_id INT NOT NULL REFERENCES occasion(occasion_id),
  post_id INT NOT NULL REFERENCES posts(post_id),
  ingredients INT NOT NULL REFERENCES grocery(grocery_id)
);
