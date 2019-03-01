# README
This README would normally document whatever steps are necessary to get the
phone no. converter package up and running.

## Features
* This will convert the enterd phone number to the words
* Validate the number

## Ruby version
This is tested under ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin17] ruby version.

## System dependencies

Need to install following,

* Ruby - https://www.ruby-lang.org/en/documentation/installation/

* Rspec - https://github.com/rspec/rspec

* Benchmark - This will come with the ruby installtion.

## Code Algorithem

* It takes the number from the stdin. 
* It validates the number with following validations,
    * Number should not be empty.
    * Number should not contain 0 or 1
    * Number should have only 10 digits
* If the validations are not passed, user will be notified with the validation message.
* When all the validations are passed, the phone to words creation process will start.
* Firstly, it will generate the 10 digit word for the passed number.
* After the first word successfully generated, we are generating the repeted permutation based on [3,4,5,6,7] array and 2 dimentional array will be generated. And based on this array all the words combinations will be generated.
* After the last step completed, we are generating the repeted permutation based on [3,4,5,6,7] array and 3 dimentional array will be generated. And based on this array all the words combinations will be generated.
* When we got all the words combinations, we wll selecting the words by comparing with the 10 words letter.
* In the whole process we are calling two methods which will do the following tasks,
    * Generate the words based on passed number and number mappings.
    * Check if the generated word is exist in the dictionary.

## How to Run the code?
```
* Go to the directory where you clone the code.
* Please make sure ruby is installed properly.
* Use this command - "ruby converter.rb"
```

## How to run the test suite?

```
* Go to the directory where you clone the code.
* Please make sure ruby and rspec are installed properly.
* Use this command to run the test cases for converter- "rspec tests/converter_tests.rb"
* Use this command to run the test cases for validator- "rspec tests/validator_tests.rb"
```