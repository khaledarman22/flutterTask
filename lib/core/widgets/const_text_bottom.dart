import 'package:flutter/material.dart';

SizedBox textButton({
  required String text,
  required MediaQueryData mediaQueryData,
  required void Function()? onPressed,
}) =>
    SizedBox(
      width: mediaQueryData.size.width,
      height: 55,
      child: ElevatedButton(
        focusNode: FocusNode(),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 72, 168, 195)),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
    );
