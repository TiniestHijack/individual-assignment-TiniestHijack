# assessment
individual assesment for AWAD

# Purpose
-Application database is postgresql not mysql to ease development with heroku, though problems did still arise as shown below.
-Web application for viewing a selection of 5000 movies which allows you to purchase them for streaming, sign in on user and admin accounts, and  get info for each movie as well as search for your desired film. Faker is used to make customer and user data with credit cards and addresses and etc., and this data is linked to the movies table. Users can "purchase" a film once they are signed in and have a credit card added, they can rent or buy for different prices and then their purchase shows up.
-Has OWASP standards for forceful browsing, SQL injections, securely stored active session tokens with activerecord-session-store, and redirection features for guests and users. Admin can access purchases.
-Testing is done with rspec and capybara and works with firefox though there are issues that are listed below. Validation is enabled on all models to make sure forms are filled correctly.
-Has admin and user acounts for making purchases, admin is only accessible from the link in the top bar and the password is listed below. Guests cannot browse into other areas of the app besides movies without first logging in or creating an account.
-Search feature works perfectly, and includes a filter to refine what is being looked for. However, text has to match what is being looked for by case (substrings do work though).

# Team Members
-Ian Nostrant

# Issues
Note: There are a lot of different interactions that can happen between users and redirecting pages so if anything does not work it is probably unexpected and I just did not happen to test it.

-The main issue is that when passing between controllers, referenced variables like the customer or user, seem to get jumbled and then the program thinkgs that there is no value for a certain field and an error is thrown. Either this or it will automatically reroute to the home page of movies. The only work arounds I have found are selecting a completely different account, re-seeding the data tables to get rid of old accounts, and then going through, or simply picking a different movie and entering different info. I would definitely do more work in making the controllers connected more logically next time.

-The tests using capybara are not entirely working. One is that the tables will not load even though the browser opens and waits for a sufficient time, unsure of how to solve this I tried refreshing the page and waiting as I said. Also, log in test fails when entering credit card dates due to there being a day. Capybara freaks out at this for some reason and doesn't continue.

-The application periodically will reroute back to the main page when going through user pages like purchasing or looking at account info. I think this is because I am passing object id's through the routing calls after submitting forms and the value is lost if a page is reloaded, not totally sure though. Routing the views from one to the next caused a few problems but it works effectively when the app is run locally.

-Heroku is up and running and everything is seeded correctly. However, it can freak out when going through the login pages and when told to reroute because there is no active user. I think this is a problem with passing variables and the session tokens but also not entirely sure. Also it does not work with the movie posters gotten from IMDB for some reason.

# Running the application
bundle install
rake db:migrate
rake movies:seed_movies
rake customers:seed_customers
rails server

-Note that there are two different seed files and movies must be run first, if it is not then the tables need to be dropped and reloaded because they reference each other and it causes issues.
-The admin account has a set password and username, but regular user accounts can be created at any time and will add on to the application. Purchases will also show up after making them even though you don't actually get to stream a movie.

Admin:
admin@user.com
password

# Viewing it elsewhere
-There is a github repository at the link below, I also submitted a pull request from the original application so it should be available to you.

Git Repository
https://github.com/TiniestHijack/individual-assignment-TiniestHijack


-The app is up on heroku, read the problems I listed for it in the above section.

Heroku:
https://floating-harbor-31450.herokuapp.com
