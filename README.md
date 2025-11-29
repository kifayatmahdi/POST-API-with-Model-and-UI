# post_api_with_model_and_ui
This project demonstrates how to perform a **POST API** request in Flutter using:
- `http` package
- Model class (Dart object → JSON)
- API Service Layer
- Form UI (TextFields + Button)
- Success & Error Snackbars

## Features
- Create a form with Title and Body fields
- Convert form data → Dart model object
- Convert Dart object → JSON
- Send JSON using **HTTP POST** request
- Display loading indicator while sending data
- Show confirmation using Snackbars
- Fake API endpoint used for practice

## Project Structure
```sh
   lib/
    ├── main.dart
    ├── api_service.dart
    ├── post_model.dart
    └── create_post_screen.dart
```

## `post_model.dart`
- Defines the data structure
- Includes `toJson()` to convert Dart object → JSON

## `api_service.dart`
- Handles API call using `http.post()`
- Sends JSON to the server
- Returns Success/Failure

## `create_post_screen.dart`
- UI with TextFields
- Button to submit the form
- Shows Snackbar for success or error

## Installation
**1. Clone this repository:**
```sh 
   git clone https://github.com/kifayatmahdi/POST-API-with-Model-and-UI.git
```
**2. Open the project in Android Studio / VS Code**
**3. Install dependencies:**
```sh 
   flutter pub get
```
**4. Run the app:**
```sh 
   flutter run
```

## How the POST Request Works
- User enters title and body
- Data stored in a PostModel
- Data converted to JSON using `toJson()`
- API service sends `http.post()`
- If successful (`statusCode == 201`) → show success Snackbar
- TextFields clear automatically

## Dependencies
```sh
   dependencies:
     http: ^1.2.2
     flutter:
       sdk: flutter
```
