mixin FormValidationMixin {
  final passwordRegEx = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');

  final upperCaseRegEx = RegExp(r'[A-Z]');

  final lowerCaseRegEx = RegExp(r'[a-z]');

  final numberRegEx = RegExp(r'[0-9]');

  //final emailRegEx = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
  final emailRegEx = RegExp(r'^[\w\\.-]+@[a-zA-Z\d\\.-]+\.[a-zA-Z]{2,}$');

  final mobileRegEx = RegExp(r'^[0-9]{10}$');

  String? usernameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? inputValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? mobileValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    /*if (!mobileRegEx.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }*/
    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email address';
    }
    if (!emailRegEx.hasMatch(value)) {
      return 'Please enter valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    if (!passwordRegEx.hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter, 1 lowercase letter and 1 number';
    }
    return null;
  }
}

String? passwordConfirmationValidator(String? value, String? passwordValue) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (!value.contains(passwordValue!)) {
    return "Password don't match";
  }

  return null;
}

String? otpValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter the otp value';
  }

  if (value.length < 6) {
    return 'OTP must be at least 6 characters';
  }
  return null;
}