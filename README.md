# Taqtics Automation Assignment

## Project Description
This repository contains automation scripts for:
- Website login functionality using Robot Framework and Selenium.
- API testing of `https://landmark.taqtics.co/v1/external/generateAuthToken` endpoint using Robot Framework and RequestsLibrary.

## Prerequisites
- Python 3.x installed
- Robot Framework installed (`pip install robotframework`)
- SeleniumLibrary installed (`pip install robotframework-seleniumlibrary`)
- RequestsLibrary installed (`pip install robotframework-requests`)
- Chrome browser and ChromeDriver installed

## Setup Instructions
1. Clone this repository.
2. Install dependencies using `pip install -r requirements.txt`.
3. Update the ChromeDriver path in the `PATH` environment variable if necessary.

## Running Tests
### Login Tests
Run the following command in terminal:
robot LoginTest.robot
