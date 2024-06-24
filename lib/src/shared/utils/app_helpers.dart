import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppHelpers {
  AppHelpers._();

  static showAlert({required BuildContext context, required Widget child}) {
    return showDialog(
      context: context,
      builder: (context) {
        return child;
      },
    );
  }


  static String formatNumber(num number) {
    return NumberFormat.decimalPattern().format(number);
  }


  static bool isMtn(String value) {
    return (value.startsWith('650') ||
            value.startsWith('651') ||
            value.startsWith('652') ||
            value.startsWith('653') ||
            value.startsWith('654') ||
            value.startsWith('67') ||
            value.startsWith('68'))
        ? true
        : false;
  }

  static String generateInitial({
    required String name,
    String? surname,
  }) {
    return (surname != null)
        ? (name[0].capitalizeFirst + surname[0].capitalizeFirst)
        : name[0].capitalizeFirst;
  }

  static String fullName({
    required String name,
    String? surname,
  }) {
    return (surname != null)
        ? (name + surname).capitalize
        : name.capitalizeFirst;
  }

  static String chosenIdiom({required String idiomTitle}) {
    String idiom = ('en');
    switch (idiomTitle) {
      case 'Français' || 'French' || 'Francés':
        idiom = ('fr');
        break;
      case 'English' || 'Inglés' || 'Anglais':
        idiom = ('en');
        break;
      case 'Spanish' || 'Español' || 'Espagnol':
        idiom = 'es';
        break;
    }
    return idiom;
  }


  static int? getFullNumber(String countryCode, String number) {
    final value = "$countryCode$number".removeAllWhitespace;
    return int.parse(value);
  }

  static String signature([int length = 10]) {
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final random = Random();
    final value = String.fromCharCodes(Iterable.generate(length, (_) {
      return chars.codeUnitAt(random.nextInt(chars.length));
    }));
    return value;
  }


}
