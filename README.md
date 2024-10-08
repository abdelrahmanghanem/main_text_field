# MainTextField Flutter Package

The `MainTextField` package is a customizable form field widget built for Flutter, offering various configurations to adapt to a wide range of use cases, such as inputting text, email, password, phone numbers, and more. It provides advanced functionality like validation, customizable appearance, and support for keyboard actions and user interactions.

## Table of Contents

- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
    - [Basic Usage](#basic-usage)
    - [Factory Constructors](#factory-constructors)
- [Localization](#localization)
- [Customization Options](#customization-options)
- [Properties](#properties)
- [Factory Constructors](#factory-constructors)
    - [Email](#email)
    - [Password](#password)
    - [Confirm Password](#confirm-password)
    - [Number](#number)
    - [Phone](#phone)



## Features

- **Configurable input fields**: Supports text, email, password, confirm password, number, and phone input types.
- **Customizable decorations**: Add prefix/suffix icons, background color, and custom borders.
- **Validation support**: Easily integrate field validation logic with custom validators.
- **Various input types**: Control the keyboard type, input formatting, and input actions.
- **Required field indicator**: Display an asterisk for required fields.
- **Text customization**: Support for custom styles, text capitalization, alignment, and hint text.

## Installation

1. Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  main_text_field: <latest_version>
```


## Usage

### Basic Usage

Here is an example of how to use the `MainTextField` widget in your Flutter application:

```dart
MainTextField(
  labelText: "Your Name",
  hintText: "Enter your full name",
  onChanged: (value) {
    print("Value changed: $value");
  },
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  },
)
```
## Localization

To enable validation message localization in the Factory Constructors, add `ValidationLocalizations.delegate` to your app's list of delegates:

```dart
  MaterialApp(
    localizationsDelegates: [
      ValidationLocalizations.delegate,
   
      // other delegates...
    ],
    // other app configurations...
  )
```


### Customization Options

`MainTextField` provides multiple customization options for a wide range of configurations:

- Width and radius for the input field
- Input formatters and input type
- Read-only state for disabled input
- Custom label, hint, and error messages
- Prefix and suffix icons for additional user feedback or actions
- Support for dense layout and padding
- Text alignment, capitalization, and input validation

## Properties

Below is a list of the most commonly used properties:

| Property        | Type                                | Default Value          | Description                                                    |
|-----------------|-------------------------------------|------------------------|----------------------------------------------------------------|
| `width`         | `double`                            | 370                    | Sets the width of the text field.                               |
| `radius`        | `double`                            | 12                     | Radius for rounding the corners of the text field.              |
| `minLines`      | `int`                               | 1                      | Minimum number of lines for multiline input.                    |
| `maxLines`      | `int`                               | 1                      | Maximum number of lines for multiline input.                    |
| `keyboardType`  | `TextInputType`                     | `TextInputType.text`    | Type of keyboard to display (text, email, number, etc.).        |
| `validator`     | `String? Function(String?)?`        | `null`                 | Function to validate the input. Returns error string if invalid.|
| `onSave`        | `void Function(String?)?`           | `null`                 | Callback to save the input value.                               |
| `onChanged`     | `void Function(String)?`            | `null`                 | Callback triggered when the input value changes.                |
| `readOnly`      | `bool`                              | `false`                | Makes the field read-only.                                      |
| `controller`    | `TextEditingController?`            | `null`                 | Manages the text field's text and state.                        |
| `prefixIcon`    | `Widget?`                           | `null`                 | Widget to show as a prefix inside the input field (e.g., an icon).|
| `suffixIcon`    | `Widget?`                           | `null`                 | Widget to show as a suffix inside the input field.              |
| `textAlign`     | `TextAlign?`                        | `TextAlign.start`       | Alignment of the input text within the field.                   |
| `labelText`     | `String?`                           | `null`                 | Text displayed above the field as a label.                      |
| `hintText`      | `String?`                           | `null`                 | Text displayed inside the field when it is empty.               |
| `isEnable`      | `bool`                              | `true`                 | Enables or disables the text field.                             |
| `isRequired`    | `bool`                              | `true`                 | Marks the field as required for validation purposes.            |

## Factory Constructors

The `MainTextField` class offers multiple factory constructors to create specific types of input fields easily. Below are the most commonly used ones:

### Email

<details>
<summary>Example Code </summary>

```dart
  MainTextField.email(
    onSaved: (val) => email = val,
  )
```
</details>

### Password

```dart
  MainTextField.password(
    onSaved: (val) => password = val,
  )
```
### Confirm Password

```dart
  MainTextField.confirmPassword(
    passwordValue: "password_value",
    onSaved: (val) => confirmPassword = val,
  )
```
### Number

```dart
  MainTextField.number(
    onSaved: (val) => number = val,
  )
```
### Phone

```dart
  MainTextField.phone(
    onSaved: (val) => phone = val,
  )
```


## Contributions
Feel free to contribute to this project.

If you find a bug or want a feature, but don't know how to fix/implement it, please fill an [issue](https://github.com/abdelrahmanghanem/main_text_field/issues).  
If you fixed a bug or implemented a feature, please send a [pull request](https://github.com/abdelrahmanghanem/main_text_field/pulls).

<a href="https://github.com/abdelrahmanghanem/main_text_field/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=abdelrahmanghanem/main_text_field"  alt=""/>
</a>

Made with [contrib.rocks](https://contrib.rocks).



