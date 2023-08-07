import 'package:flutter/material.dart';

Widget defaultButton({
  required String text,
  required Function press
})=> SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
              primary: Colors.white,
              backgroundColor: Colors.indigo
          ),
          onPressed: (){ press; },
          child: Text(text,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white),
          )),
);
