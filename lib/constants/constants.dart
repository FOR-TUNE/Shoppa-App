import 'package:flutter/material.dart';
import 'package:shoppa_app/constants/colors.dart';
import 'package:shoppa_app/constants/size_configurations.dart';

TextStyle headerStyle = TextStyle(
    color: headerTextColor,
    fontFamily: 'Manrope',
    fontSize: getPropHeight(32),
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0);

TextStyle headerStyle2 = TextStyle(
    color: headerTextColor,
    fontFamily: 'Manrope',
    fontSize: getPropHeight(24),
    fontWeight: FontWeight.w700,
    letterSpacing: 2.0);

TextStyle headerStyle3 = TextStyle(
    color: headerTextColor,
    fontFamily: 'Manrope',
    fontSize: getPropHeight(18),
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0);

TextStyle whiteHeaderStyle = TextStyle(
    color: bgColor,
    fontFamily: 'Manrope',
    fontSize: getPropHeight(18),
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0);

TextStyle subHeaderStyle = TextStyle(
  color: subHeaderTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

TextStyle subHeaderStyle2 = TextStyle(
  color: subHeaderTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(14),
  fontWeight: FontWeight.w400,
);

TextStyle regTextStyle = TextStyle(
  color: regularTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

TextStyle subTextStyle = TextStyle(
  color: subTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(12),
  fontWeight: FontWeight.w400,
);

TextStyle primaryButtonText = TextStyle(
  color: primaryButtonTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

TextStyle secondaryButtonText = TextStyle(
  color: secondaryButtonTextColor,
  fontFamily: 'Lato',
  fontSize: getPropHeight(16),
  fontWeight: FontWeight.w400,
);

TextStyle ordersCardText1 = TextStyle(
    color: bgColor,
    fontFamily: 'Lato',
    fontSize: getPropHeight(10),
    fontWeight: FontWeight.w400,
    letterSpacing: 2.0);

TextStyle ordersCardText2 = TextStyle(
    color: bgColor,
    fontFamily: 'Lato',
    fontSize: getPropHeight(16),
    fontWeight: FontWeight.w400,
    letterSpacing: 2.0);

TextStyle ordersCardText3 = TextStyle(
    color: bgColor,
    fontFamily: 'Lato',
    fontSize: getPropHeight(12),
    fontWeight: FontWeight.w400,
    letterSpacing: 2.0);

TextStyle inventoryPriceText = TextStyle(
    color: secondaryButtonTextColor,
    fontFamily: 'Lato',
    fontSize: getPropHeight(18),
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0);

const animationduration = Duration(seconds: 3);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9,]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String emailNullError = "Please enter your email address";
const String invalidEmailError = "Please enter a valid email";
const String passNullError = "Please enter your password";
const String incorrectPassError = "Password is incorrect";
const String shortPassError = "Password is too short";
const String passMatchError = "Password's does not match";
const String nameNullError = "Please enter your name";
const String phoneNumberNullError = "Please enter your phone number";
const String firstNameNullError = "Please enter your First Name";
const String lastNameNullError = "Please enter your Last Name";
const String phoneNumNullError = "Please enter your Phone Number";
const String storeNameNullError = "Please enter your Store Name";
const String addressNullError = "Please enter your Store address";
const String storeNumNullError = "Please enter your Store's Phone Number";

InputDecoration textFieldDecoration(String fieldtext) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      hintText: fieldtext,
      hintStyle: subTextStyle,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: textFieldBorderColor,
          ),
          gapPadding: 10));
}

InputDecoration textCreateOrderFieldDecoration(String fieldtext) {
  return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      hintText: fieldtext,
      hintStyle: subTextStyle,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: textFieldBorderColor,
          ),
          gapPadding: 10));
}
