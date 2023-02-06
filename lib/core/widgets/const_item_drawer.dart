import 'package:flutter/material.dart';

class ConstItemDrawer extends StatelessWidget {
  const ConstItemDrawer(
      {Key? key, required this.text, required this.icon, required this.onTap})
      : super(key: key);
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
