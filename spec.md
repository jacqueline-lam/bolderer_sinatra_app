# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app - controllers inherit from Sinatra::Base and define HTTP interface for the app;
  - Used Corneal gem for scaffolding
  - Separate directories for models, controllers, views (with separation of concerns)
- [x] Use ActiveRecord for storing information in a database
  - used ActiveRecord to make queries to my SQLite database
- [x] Include more than one model class (e.g. User, Post, Category)
  - User, Problem, Style
- [X] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
  - User has_many Problems
  - Problem has_many Styles through ProblemStyles
  - Style has_many Problems through ProblemStyles
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
  - Problem belongs_to user
- [x] Include user accounts with unique login attribute (username or email)
  - Validate uniquess of user login attribute by ensuring that there is no exisitng user account with the entered username (prevent duplicates)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
  - Logged in user has access to CRUD actions: ability to create sessions (login)/ poblems, read, update or delete problems
  - Controller actions following restful conventions and map to CRUD actions
  - Mapping URL in uniform manner to specific HTML verb we want -> to data we want to get/post -> to specific view we want to render;
- [x] Ensure that users can't modify content created by other users
  - Views are protested based on helper methods `logged_in?` and `current_user`
  - User authorization - users can only edit/ delete the resources (problems) they created
  - `session_hash` dictates what user can see/ edit
  - Request user to verify identityy by logging in (with valid credentials)
- [x] Include user input validations
  - No blank username/ password when submitting user sign up form
  - New/ Edit problem form cannot be submitted without a chosen color, grade, and style(s) according to HTML form - image is optional;
- [X] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
  - Error Message displayed when:
    - user tries to sign up with exisitng username, or without username + password
    - user tries to signs in without correct user credentials
    - user leaves problem grade/ color/ date blank in the create problem form in 'problems/new.erb' (HTML generated error message)
    - user leaves problem style blank in Create Problem form or Edit Problem form
- [X] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

### Blog Post:
https://dev.to/jacquelinelam/sinatra-web-app-mvc-sessions-and-routes-52on

Confirm
- [x] You have a large number of small Git commits
  - every 15-20 lines
- [x] Your commit messages are meaningful
  - explain what changes and where
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
