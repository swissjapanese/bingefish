## Requirements
* git
* ruby 2.3.1 or higher
* mysql


## Setup Guide
* pull the repo locally
* run `bundle install -j4` at the root of the directory location
* run `mv config/application.yml.example config/application.yml`
* populate `application.yml` with the required api keys and credentials
* request a copy of the database dump and load that to your mysql database
* run `rails server`, you can then visit `htpp://localhost:3000`


## Common Errors / Problems
* Access denied errors from TvDbApi.
    You can solve these issues by running `TheTvDbApi.request_token` at your rails console. The JWT token you have locally will expire in 12 hours so it needs to be refreshed/generated manually unless you are running the cronjob that automatically does this for you every 12 hours


## Contributing
1. Pull the latest version of master
2. Make a new branch based on the feature you are working on like `feature/some-new-feature` or `hotfix/some-new-bug`
3. Once you are happy with your code, push your branch to the repo and make a new pull request
