import 'package:flutter/material.dart';
import 'package:fluttertask/core/cache_helper.dart';
import 'package:fluttertask/features/auth_feature/presentation/view/Login_screen.dart';
import 'package:fluttertask/features/home_feature/presentation/view/home_screen.dart';

import 'const_item_drawer.dart';

class ConstDrawer extends StatelessWidget {
  const ConstDrawer({
    super.key,
    required this.mediaQueryData,
  });

  final MediaQueryData mediaQueryData;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: mediaQueryData.padding.top,
          ),
          ConstItemDrawer(
              icon: Icons.home,
              text: 'Home',
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              }),
          const SizedBox(
            height: 10,
          ),
          ConstItemDrawer(
            icon: Icons.login,
            text: 'Login',
            onTap: () {
              CacheHelper.deleteCachData(key: 'token');
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ));
            },
          ),
        ],
      ),
    ));
  }
}
