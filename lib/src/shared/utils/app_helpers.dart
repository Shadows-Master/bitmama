import 'dart:io';
import 'dart:math';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:toastification/toastification.dart';

import '../components/app_title.dart';
import '../constants/app_dimens.dart';

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

  static Future<File?> loadImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picture = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
      maxHeight: 600,
    );
    return (picture != null) ? File(picture.path) : null;
  }

  static Future<File?> loadImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? picture = await picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 600,
      maxHeight: 600,
    );
    return (picture != null) ? File(picture.path) : null;
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

  static toast(BuildContext context, String message) => Toastification().show(
        context: context,
        title: const AppTitle.h2(
          title: "Success",
          fontWeight: FontWeight.w700,
        ).paddingOnly(top: AppDimens.halfPadding),
        description: AppTitle(title: message),
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: 2.ms,
        animationDuration: 2.microseconds,
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding, vertical: AppDimens.halfPadding),
      );

  static notify(BuildContext context, String message, {bool isSuccess = true}) {
    isSuccess
        ? CherryToast.success(
            title: Text(message, style: context.headlineLarge),
            toastPosition: Position.bottom,
            borderRadius: AppDimens.borderRadius,
            backgroundColor: context.colorScheme.surface,
          ).show(context)
        : CherryToast.warning(
            title: Text(message, style: context.headlineLarge),
            toastPosition: Position.bottom,
            borderRadius: AppDimens.borderRadius,
            backgroundColor: context.colorScheme.surface,
          ).show(context);
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
