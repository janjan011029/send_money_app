# Send Money App

Hi, I'm Jaime Jr. Aballe. This guide will help you set up and run the Send Money App project.

## Getting Started

### Step 1: Clone the Project

First, clone this project to your local machine:

```bash
git clone https://github.com/janjan011029/send_money_app.git
cd send_money_app
```

### Step 2: Clean and Get Dependencies

Navigate to the main folder and run the following commands:

```bash
flutter clean && flutter pub get
```

### Step 3: Create a .env File

Before running the app, you need to create a .env file inside the send_money_app folder. Add the following line to the file:

```env
API_KEY=your_api_key_here
```

Replace your_api_key_here with the value provided in the email I sent you.

### Step 4: Run the Application

After setting up the .env file, you can run the app:

```bash
    flutter run --dart-define-from-file=.env
```

Or just go to the VSCode Run and Debug Icon in your Upper left side

### Step 5: Running Unit Tests

To run the unit tests, execute the following command in your terminal:

```bash
    flutter test test/unit_test/features/
```

Alternatively, you can navigate to the specific test files in your IDE and press the run button to view the detailed results of the unit tests.

### Additional: Running Integration Tests

I've included some integration tests in certain scenarios to demonstrate my understanding of integration testing. However, I've found that they are quite time-consuming to complete.

To run the integration test

```bash
    flutter test test/integration_test/
```

## Features

*  Wallet Balance: Includes show and hide functionality.
*  Send Money transaction: Allows users to send money through the app.
*  View detailed transaction history: Provides a detailed history of all transactions.

## Technologies Used

* Flutter: Cross-platform framework for building mobile applications.
* Dart: Programming language used with Flutter.
* mockfly API: Customizable API integration.
* Bloc State Management: Utilizing the Bloc library for state management.
* Repository Pattern: Utilizing the repository pattern for data management and abstraction.
* Clean Architecture: Following the principles of Clean Architecture for organized and maintainable code.
* GoRouter: Implementing the GoRouter package for navigation within the app.
* Dio: A powerful HTTP client for Dart, used for making network requests.
* Unit testing: Focuses on testing individual units or components of the app, ensuring that each part functions correctly in isolation.
* Integration testing: Validates the interaction between various modules and the overall flow of the app, ensuring that all components work together as expected.
