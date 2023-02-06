import 'package:flutter/material.dart';

PreferredSizeWidget constAppBar({title}) => AppBar(
      title: title,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
