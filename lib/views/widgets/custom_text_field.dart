import 'package:flutter/material.dart';
import 'package:notes_app/constant/app_constatnt.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.maxLine = 1,
      required this.hint,
      this.onSaved,
      this.onChanged});

  final int maxLine;
  final String hint;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onSaved: onSaved,
        onChanged: onChanged,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is Required !!";
          } else {
            return null;
          }
        },
        cursorColor: primaryColor,
        maxLines: maxLine,
        decoration: InputDecoration(
          hintText: hint,

          // hintStyle: TextStyle(color: primaryColor),
          border: buildBorderMethod(),
          enabledBorder: buildBorderMethod(),
          focusedBorder: buildBorderMethod(primaryColor),
        ));
  }

  OutlineInputBorder buildBorderMethod([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
