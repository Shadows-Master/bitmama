import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:bitmama/src/shared/extensions/app_context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../constants/app_dimens.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final Widget? suffixIcon;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? prefix;
  final String? hintText;
  final String? prefixText;
  final String? labelText;
  final bool isPassword;
  final bool isTextArea;
  final bool isBorderLess;
  final bool isComposed;
  final String? helperText;
  final bool readOnly;
  final String? Function(String?)? validator;
  final String? initialValue;
  final VoidCallback? onTap;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final bool? isExpands;
  final bool? isFilled;
  final bool? autoFocus;
  final BorderSide? borderSide;
  final TextCapitalization textCapitalization;

  const AppFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.isPassword = false,
    this.isTextArea = false,
    this.isBorderLess = true,
    this.isComposed = true,
    this.readOnly = false,
    this.keyboardType,
    this.prefixIcon,
    this.helperText,
    this.suffixIcon,
    this.validator,
    this.initialValue,
    this.onTap,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.isExpands = false,
    this.borderSide,
    this.suffix,
    this.prefix,
    this.prefixText,
    this.maxLength,
    this.focusNode,
    this.isFilled = true,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: context.headlineMedium?.copyWith(
        color: context.colorScheme.primary,
      ),
      autofocus: autoFocus!,
      textCapitalization: textCapitalization,
      validator: validator,
      controller: controller,
      readOnly: readOnly,
      initialValue: initialValue,
      onTap: onTap,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      maxLength: maxLength,
      onChanged: onChanged,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.newline,
      expands: isExpands!,
      maxLines: maxLines,
      minLines: minLines,
      obscureText: isPassword,
      focusNode: focusNode,
      cursorColor: context.colorScheme.secondary,
      decoration: InputDecoration(
        helperText: helperText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: isFilled,
        prefix: prefix,
        prefixText: prefixText,
        suffix: suffix,
        labelText: labelText,
        hintText: hintText,
        counterText: "",
        prefixStyle: context.headlineSmall,
        hintStyle: context.headlineMedium?.copyWith(
          color: context.colorScheme.onSurface,
        ),
        labelStyle: context.headlineMedium?.copyWith(
          color: context.colorScheme.secondary,
        ),
        errorStyle: context.headlineSmall?.copyWith(
          color: context.colorScheme.error,
        ),
      ),
    )
        .paddingSymmetric(
          horizontal: AppDimens.halfPadding,
          vertical: AppDimens.halfPadding,
        )
        .animate()
        .fadeIn(duration: 500.ms)
        .slide();
  }
}
