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
    flutter run
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