import 'package:flutter/material.dart';

class LodingCircul extends StatelessWidget {
  const LodingCircul({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
