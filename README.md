## Requirements
* git
* ruby 2.3.1 or higher
* postgresql


## Setup Guide
* pull the repo locally
* run `bundle install -j4` at the root of the directory location
* run `mv config/application.yml.example config/application.yml`
* populate `application.yml` with the required api keys and credentials
* run `rails db:setup`
* run `rails server`, you can then visit `htpp://localhost:3000`


## Contributing
1. Pull the latest version of master
2. Make a new branch based on the feature you are working on like `feature/some-new-feature` or `hotfix/some-new-bug`
3. Once you are happy with your code, push your branch to the repo and make a new pull request
