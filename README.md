
# Flutter News App

This is a Flutter application for fetching and displaying news articles from various sources. The app provides user authentication using Firebase and allows users to explore the latest news.

Screen Recording Link :- https://drive.google.com/file/d/1KpaOiwNAv_r-yvX86MH4X4VZ0bg580VY/view?usp=sharing 

## Libraries/Frameworks Used

- **Flutter:** Flutter is an open-source UI software development toolkit created by Google. It is used to build natively compiled applications for mobile, web, and desktop from a single codebase.

## Packages Used

- **firebase_auth: ^4.9.0**
  - **Description:** This package provides Firebase Authentication services for your app. It allows users to sign up, sign in, and manage their accounts securely.
  - **Reason for Use:** Firebase Authentication simplifies user management and offers various authentication methods.

- **firebase_core: ^2.15.1**
  - **Description:** Firebase Core is a necessary dependency for Firebase services in your app. It initializes Firebase and sets up your project.
  - **Reason for Use:** Required for using other Firebase services, such as Firebase Authentication.
 
- **intl: ^0.18.1**
  - **Description:** The intl package provides internationalization and localization support for your app. It's useful for formatting dates, numbers, and strings based on the user's locale.
  - **Reason for Use:** To properly format dates in our app, especially in the news section.

- **google_sign_in: ^6.1.5**
  - **Description:** The google_sign_in package is used for Google Sign-In integration in your app. It enables users to sign in with their Google accounts.
  - **Reason for Use:** Google Sign-In is a popular authentication method, and this package simplifies its implementation.

- **http: ^0.13.6**
  - **Description:** The http package is used to make HTTP requests to APIs and fetch data from external sources.
  - **Reason for Use:** It's essential for fetching data from external APIs, like the News API I have used.

- **cached_network_image: ^3.2.3**
  - **Description:** This package provides image caching capabilities for network images. It helps optimize image loading in your app.
  - **Reason for Use:** Caching images reduces network requests and improves app performance.


## News API

- **NewsAPI.org:** This app fetches news data from the NewsAPI.org website. NewsAPI.org provides a reliable source of news articles from various publishers worldwide.
  
Zip File Download Link :-https://drive.google.com/file/d/1RL9bn6WHDoG_z6qTWsynFLEgZYlnCYXl/view?usp=sharing 

## Installation

To run this Flutter app on your local machine, follow these steps:

1. Clone the repository to your computer: 
2. Navigate to the project directory: `cd flutter-news-app`
3. Install the required packages using Flutter: `flutter pub get`
4. Run the app: `flutter run`
