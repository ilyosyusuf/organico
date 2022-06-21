import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          hintText: text,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          // fillColor: ColorConst.formFieldColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            // borderSide: const BorderSide(color: ColorConst.kPrimaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            // borderSide: BorderSide(color: ColorConst.blackfortext),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            // borderSide: BorderSide(color: ColorConst.blackfortext),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            // borderSide:  BorderSide(color: ColorConst.kPrimaryColor),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        validator: validator);
  }
}
