import 'package:email_validator/email_validator.dart';

class InputValidator {
  static const int PASSWORD_LENGTH = 8;

  validatePassword(final String? value) {
    if (_isValidValue(value) && value!.trim().length > PASSWORD_LENGTH) {
      return null;
    }
    return "Password must be at least " + "$PASSWORD_LENGTH characters long!";
  }

  validateEmail(final String? value) {
    if (_isValidValue(value) && EmailValidator.validate(value!)) {
      return null;
    }

    return "Please enter a valid email!";
  }

  validateUsername(final String? value) {
    if (_isValidValue(value)) {
      return null;
    }
    return "Please enter a valid username!";
  }

  validateBasicText(final String? value, final String hintText) {
    if (_isValidValue(value)) {
      return null;
    }
    return "Please enter a valid ${hintText.toLowerCase()}!";
  }

  _isValidValue(final String? value) {
    return !(value == null && value!.trim().isEmpty);
  }
}