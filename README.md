# NeversitupCrypto Application (iOS)

The NeversitupCrypto is a mobile application designed to provide a current Bitcoin rate and convert the USD, EUR, and GBP to BTC.

## Getting Started (How to Download)

To download and run the app, follow these steps:

1. Download the ZIP file containing the project.
2. Open Xcode by clicking on the .xcodeproj file.
3. Build and run the project using the keyboard shortcut cmd + R.

## About the Project

The NeversitupCrypto is developed using Swift and SwiftUI framework for the frontend. The project follows the MVVM (Model-View-ViewModel) software architecture.

### Development

The application is written in Swift, making use of SwiftUI for the user interface and XCTests for the unit test. The MVVM architectural pattern is employed to ensure a structured and scalable codebase.

### User Interface

<img src="https://github.com/runners008/NeversitupCrypto/assets/57987228/b388131c-33f5-43c6-978e-30c64ce3000d" alt="Image 1" style="width: 200px;">

The app consists of two main sections:

1. The Bitcoin converter section

  <img width="400" alt="Screenshot 2566-07-16 at 17 00 35" src="https://github.com/runners008/NeversitupCrypto/assets/57987228/01802e8a-6cef-4e02-91a7-449a1689eed3">

(1.1) Picker View allow users to choose their favorite currency.

(1.2) Current Rate will show the current exchange rate of 1 BTC to the chosen currency.

(1.3) Enter Amount allow users to type the amount of the selected currency and convert into BTC amount.

(1.4) BTC Amount will snow the amount of BTC, compared to the chosen currency.
   
2. Historical Bitcoin value
<img width="400" alt="Screenshot 2566-07-16 at 17 10 09" src="https://github.com/runners008/NeversitupCrypto/assets/57987228/b3f4b68f-a4ee-4b91-afa9-b9839574d2c6">
<img width="400" alt="Screenshot 2566-07-16 at 17 09 59" src="https://github.com/runners008/NeversitupCrypto/assets/57987228/51dbe39b-812d-44f2-9d7e-d46222cbf855">

(2.1) Picker View allow users to choose view option.

(2.2) LineChartView show the historical BTC values in Line Chart

(2.3) ListView show the historical BTC values in List.

## Features

The NeversitupCrypto offers the following features:

- Show the current exchange rate of BTC (updated every 60 seconds).
  
- Allow user to type USD, GBP, EUR amount and convert to BTC amount.
  
- Allow user to change the currency between USD, GBP, EUR.

- Allow user to view the historical value of BTC in graphs or list.

## APIs

The app utilizes the API services provided by CoinDesk to retrieve currency data.

- API for retrieving currency exchange rate information: https://api.coindesk.com/v1/bpi/currentprice.json

Feel free to explore the app!
