# Log Reader

A program to parse a log file and return an ordered list of viewing data, currently:
- counting and sorting by total page view
- counting and sorting b unique page views

#### Dependencies:
##### Ruby version `2.5.0`

#### Setup:

- Run `bundle install` to install dependencies

#### Tests:

- Run `rspec` to run full test suite

### Running

- run `ruby bin/log_reader {your_file_path_here.log}`

##### Example file provided:
- run `ruby bin/log_reader examples/webserver.log`  to run the program on a provided example file


#### To note:
- program will only accept log files as arguments
- program will not function if file doesn't exist or contains no relevant data
- file currently only recognises url and ip address of log lines

#### TODO:
- Split individual log line parsing into a separate class to allow easier extensibility
