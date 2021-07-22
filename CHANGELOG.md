# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).

### 1.0.0
##### Changed

- Generate gems with Circle CI instead of Travis.
- Generate dummy app with Rails 6.
- Use Review Dog instead of Hound.
- Always create mountable engines.
- Move specs out of dummy app.

### 0.6.0

##### Changed

* Replace travis with circleci.

### v0.5.0

##### Added

* Replace factory_girl with factory_bot.
* Generate engines with Rails 5.

### v0.4.0

##### Added

* Add command to configure Travis CI.
* Change test command to configure coveralls.

##### Fixed

* Run engine creation with specific Rails version to avoid unsupported Rails 5 structure.

### v0.3.0

##### Added

* Add Hound configuration.
* Deploy with Travis CI.
* Configure coveralls.

#### v0.2.0

* Command to add hound.yml and rubocop style rules.

#### v0.1.0

* Initial release.
