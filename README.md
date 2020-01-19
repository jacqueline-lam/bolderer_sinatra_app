# TODO
* create migrations
* create models with relationships
* plan out routes for controller following RESTful conventions and map out to CRUD actions
  - back and forth building our forms and controller actions
  - prevent bad data
* build controller actions and passing appropriate data to views
* Add user authentication - UsersController where user could signup
* Add user authorization
* build views (forms)
* build navigation

* validation

# Bolderer Sinatra App
This Sinatra-based app is designed by jacqueline-lam, as a porfolio project for the Flatiron School Software Engineering cirriculum.

The app provides aspiring boulderers with the opprounity to keep track of their climbs and analyze their climbing styles and progress month-over-month! Users may also check out other users' logs or get featured on the leaderboard.

<!-- Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/test/gem`. To experiment with that code, run `bin/console` for an interactive prompt. -->

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your terminal:

```git
clone "git@github.com:jacqueline-lam/bolderer_sinatra_app.git"
```

And change directory to:

    $ cd bolderer_sinatra_app

If you don't have Ruby, please install Ruby version `ruby 2.6.5p114 (2019-10-01 revision 67812) [x86_64-darwin18]
`

And then run:

    $ gem install bundler

And then run:

    $ bundle install

And then run:

    $ rake db:seed

And then run:

    $ shotgun

And go to http://localhost:9393 or the IP Address:PORT provided.

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jacqueline-lam/bolderer_sinatra_app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Authors
Jacqueline Lam - @jacqueline-lam

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Test::Gem project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jacqueline-lam/bolderer_sinatra_app/blob/master/CODE_OF_CONDUCT.md).
