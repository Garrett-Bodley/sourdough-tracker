<h1 align="center">Welcome to Sourdough Tracker 👋</h1>
<p>
  <a href="#" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

> An online utility that stores your baking recipes and allows you to take notes throughout the baking process.

## Technologies

* Ruby 2.6.1
* Sinatra
* ActiveRecord
* SQlite3

## Features

* Uses ActiveRecord to relationships to easily model ingredients and recipes and persist them in a database.
* Automatically calculates and displays each ingredient’s weight for an easy reference while breadmixing.
* Users can create secure accounts with login/logout functionality via bcrypt

## Install

```sh
bundle install
rake db:migrate
```

## Usage

```sh
shotgun
```

## Author

👤 **Garrett Bodley**

* Website: garrett-bodley.medium.com
* Github: [@Garrett-Bodley](https://github.com/Garrett-Bodley)
* LinkedIn: [@Garrett Bodley](https://linkedin.com/in/Garrett Bodley)

## Show your support

Give a ⭐️ if this project helped you!

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_