import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String hint,
  bool isClickable = true,
  int? maxLines
}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
          controller: controller,
          keyboardType: type,
          enabled: isClickable,
          maxLines: maxLines,
          validator:(s)
          {
            validate(s);
          },
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 42,vertical: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.black,width: 1),
                gapPadding: 10,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black),
                  gapPadding: 10
              )
          )
      ),
    );