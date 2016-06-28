[![Build Status](https://travis-ci.org/tigretoncio/airport_challenge.svg?branch=master)](https://travis-ci.org/tigretoncio/airport_challenge)

# Bank Tech Test

Author: Sergio Enrech Trillo

## Usage
Clone the repo from GitHub, then run bundle on the root directory.
Ruby version. 2.3.1 used

```
$ bundle
```
Gems used: Gemfile listed below

```
gem 'rspec'
gem 'capybara'
gem 'coveralls', require: false
gem 'rubocop'
gem 'reek'
gem 'rake'
gem 'timecop'

```

## Aproach

A simple design of 2 classes has been chosen:   

- **Account**: managing the account balance, deposit and withdraw, and logging these operations  
-**PrintStatement**: managing the printing out of statements

To log the data of each transaction, a simple list of arrays have been chosen, capturing the date of transaction, (can be easily extended to TimeStamp), the transaction type (credit / debit), transaction amount and updated balance.

Both classes have been built in a Test Driven Development framework, in order to test PrintScreen class doubles of the class Account have been generated following the "London school" test methodology.  16 tests (feature and unit tests) have been generated for generating both classes.

Print have been generated as requested, in a chronologically reversed order as requested, (array has been reverted for that).

## To Do

Pending things to do:

- add filters for statement
- improve GUI


