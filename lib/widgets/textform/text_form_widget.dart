import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:organico/core/constants/colors/color_const.dart';
import 'package:organico/core/constants/pmconst/pm_const.dart';

class MyTextField {
  static textField({
    required String text,
    IconButton? suffixIcon,
    required TextEditingController controller,
    IconButton? prefixIcon,
    bool read = false,
    var onChanged,
    VoidCallback? onTap,
    FormFieldValidator<String>? validator,
    bool isShown = false,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
        controller: controller,
        readOnly: read,
        onChanged: onChanged,
        onTap: onTap,
        obscureText: isShown,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: PMconst.small,
          hintText: text,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: const BorderSide(color: ColorConst.mainColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(color: ColorConst.mainColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(color: ColorConst.kPrimaryColor),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35.0),
            borderSide: BorderSide(color: ColorConst.kPrimaryColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(35.0),
          ),
        ),
        validator: validator);
  }
}
