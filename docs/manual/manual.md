# Calculator App Manual

## Introduction

The Calculator App is a versatile mobile application developed using the Flutter framework. It provides various calculator functionalities, including a simple calculator, scientific calculator, advanced calculator, money converter, and units converter. This manual will guide you through the features and usage of the Calculator App.

## Table of Contents

1. [Getting Started](#getting-started)
2. [Main Screen](#main-screen)
3. [Drawer Menu](#drawer-menu)
4. [Simple Calculator](#simple-calculator)
5. [Scientific Calculator](#scientific-calculator)
6. [Advanced Calculator](#advanced-calculator)
7. [Money Converter](#money-converter)
8. [Units Converter](#units-converter)
9. [Color Picker](#color-picker)

## Getting Started

To use the Calculator App, follow these steps:

1. Install Flutter on your development environment.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Launch the app using `flutter run`.

## Main Screen

Upon launching the app, you'll see the main screen containing the different calculator functionalities. The app's main screen includes:

- Simple Calculator
- Scientific Calculator
- Advanced Calculator
- Money Converter
- Units Converter

You can navigate between these functionalities using the drawer menu or by tapping on the corresponding buttons.

## Drawer Menu

Access the drawer menu by swiping from the left edge of the screen or tapping the hamburger icon in the app bar. The drawer menu provides quick access to the different calculator functionalities:

- Simple Calculator
- Scientific Calculator
- Advanced Calculator
- Money Converter
- Units Converter

Simply tap on a menu item to switch to the desired calculator.

## Simple Calculator

The Simple Calculator provides basic arithmetic operations. To use:

1. Enter numbers using the numeric keypad.
2. Tap the operator buttons (+, -, *, /) for the desired operation.
3. Press the "=" button to get the result.
4. The color of the calculator buttons can be customized using the color picker button in the app bar.

## Scientific Calculator

The Scientific Calculator extends functionality to include scientific operations. Use it similarly to the Simple Calculator, with additional scientific functions available.

## Advanced Calculator

The Advanced Calculator provides advanced mathematical operations. Utilize this calculator for complex calculations beyond simple arithmetic and scientific operations.

## Money Converter

The Money Converter helps you convert between different currencies. Enter the amount, select the source currency, and choose the target currency to get the converted result.

## Units Converter

The Units Converter allows you to convert between different units of measurement. Select the source unit, enter the value, and choose the target unit for conversion.

## Color Picker

The Color Picker button in the app bar allows you to customize the color of the calculator buttons. Tap the button to open the color picker, choose a color, and see the real-time updates on the calculator buttons.

Enjoy using the Calculator App! For additional support or inquiries, contact the developers.

# Scientific and Advanced Calculator Manual

## Introduction

The Scientific and Advanced Calculator is a powerful calculator application developed using Flutter. It includes scientific and advanced mathematical functions for a wide range of calculations. This manual will guide you through the features and usage of the calculator.

## Table of Contents

1. [Scientific Calculator](#scientific-calculator)
   - [Trigonometric Functions](#trigonometric-functions)
   - [Inverse Trigonometric Functions](#inverse-trigonometric-functions)
   - [Factorial, Exponent, and Square Root](#factorial-exponent-and-square-root)
   - [Modulus and Reciprocal](#modulus-and-reciprocal)
   - [Custom Functions](#custom-functions)
  
2. [Advanced Calculator](#advanced-calculator)
   - [Logarithmic Functions](#logarithmic-functions)
   - [Exponential Functions](#exponential-functions)
   - [Absolute Value and Powers](#absolute-value-and-powers)
   - [Cubed and Nth Roots](#cubed-and-nth-roots)
   - [Custom Functions](#custom-functions)

## Scientific Calculator

### Trigonometric Functions

- **sin, cos, tan**: Calculate the sine, cosine, and tangent of an angle.
- **asin, acos, atan**: Calculate the inverse sine, cosine, and tangent.

### Inverse Trigonometric Functions

- **sin⁻¹, cos⁻¹, tan⁻¹**: Calculate the arcsine, arccosine, and arctangent.

### Factorial, Exponent, and Square Root

- **! (Factorial)**: Calculate the factorial of a number.
- **^ (Exponent)**: Perform exponentiation.
- **√ (Square Root)**: Calculate the square root of a number.

### Modulus and Reciprocal

- **% (Modulus)**: Calculate the modulus of two numbers.
- **1/x (Reciprocal)**: Calculate the reciprocal of a number.

### Custom Functions

- **x√y (Nth Root)**: Calculate the Nth root of a number.

## Advanced Calculator

### Logarithmic Functions

- **log**: Calculate the logarithm of a number.
- **ln**: Calculate the natural logarithm of a number.
- **ln2**: Calculate the logarithm base 2 of a number.

### Exponential Functions

- **exp**: Calculate the exponential function of a number.

### Absolute Value and Powers

- **|x|**: Calculate the absolute value of a number.
- **x³**: Calculate the cube of a number.
- **^2**: Calculate the square of a number.

### Cubed and Nth Roots

- **∛ (Cubed Root)**: Calculate the cubed root of a number.
- **x√y (Nth Root)**: Calculate the Nth root of a number.

### Custom Functions

- **φ (Phi)**: Calculate the golden ratio.

## Usage

- **Input**: Enter numbers and perform operations using the provided buttons.
- **Clear (C)**: Reset the calculator.
- **Delete (D)**: Remove the last entered digit or operation.
- **Equals (=)**: Calculate the result.

# Currency Converter and Unit Converter App

## Overview

This application consists of two main functionalities:

1. **Currency Converter:**
   - Allows users to convert amounts between different currencies.
   - Fetches real-time exchange rates from a free currency conversion API.

2. **Unit Converter:**
   - Enables users to convert quantities between different units of measurement.
   - Utilizes the `units_converter` package for unit conversions.

## Currency Converter

### Features
- Conversion between a wide range of currencies.
- Real-time exchange rates using a free currency conversion API.
- Supports input from either the left or right side of the conversion.

### Usage

1. **Select Currencies:**
   - Use the dropdown menus to select the source and target currencies.
   - Default currencies are set to USD (U.S. Dollar) and EUR (Euro).

2. **Input Amount:**
   - Enter the amount you want to convert in the respective input field.
   - Press Enter to perform the conversion.

3. **View Results:**
   - The converted amount will be displayed in the opposite input field.
   - Both input fields are editable, allowing bidirectional conversions.

## Unit Converter

### Features
- Conversion between different types of units (e.g., length, weight, volume).
- Dynamic unit selection based on the chosen unit type.
- Supports input from either the left or right side of the conversion.

### Usage

1. **Select Unit Type:**
   - Use the dropdown menu to choose the type of unit you want to convert (e.g., length, weight).
   - Default unit type is "Amount of Substance."

2. **Select Units:**
   - Dropdowns dynamically update to show units relevant to the chosen unit type.
   - Select units for both the source and target quantities.

3. **Input Amount:**
   - Enter the amount you want to convert in the respective input field.
   - Press Enter to perform the conversion.

4. **View Results:**
   - The converted amount will be displayed in the opposite input field.
   - Both input fields are editable, allowing bidirectional conversions.

## Important Notes

- Internet connectivity is required for real-time currency exchange rate updates.
- Ensure valid numeric input for amount fields.
- Keep the application updated for potential improvements and bug fixes.