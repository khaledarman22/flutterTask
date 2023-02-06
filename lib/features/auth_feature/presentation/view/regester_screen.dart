import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/core/functions/get_device_type.dart';
import 'package:fluttertask/core/utils/enums/device_type.dart';
import 'package:fluttertask/core/widgets/const_loding_circul.dart';
import 'package:fluttertask/core/widgets/const_text_bottom.dart';
import 'package:fluttertask/core/widgets/const_text_form_feld.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/register_cubit/register_cubit.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/register_cubit/register_state.dart';
import 'package:fluttertask/features/auth_feature/presentation/view/login_screen.dart';

class RegesterScreen extends StatelessWidget {
  RegesterScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNumperController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmController = TextEditingController();
    return Scaffold(
      body:
          BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
        if (state is RegisterStateLoding) {
          return const LodingCircul();
        }
        if (state is RegisterInitial) {
          return getDeviceType(mediaQueryData) == DeviceType.mobile
              ? SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Form(
                          key: _formKey,
                          child: SizedBox(
                            width: mediaQueryData.size.width,
                            height: mediaQueryData.size.height -
                                mediaQueryData.padding.top,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textFormField(
                                  labeltext: 'Name',
                                  keyboardType: TextInputType.name,
                                  controller: nameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Name is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textFormField(
                                  keyboardType: TextInputType.phone,
                                  labeltext: 'Phone Numper',
                                  controller: phoneNumperController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'phone is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textFormField(
                                  labeltext: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Email is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textFormField(
                                  keyboardType: TextInputType.number,
                                  labeltext: 'Password',
                                  controller: passwordController,
                                  validator: (value) {
                                    if (passwordController.text.length < 6) {
                                      return 'password must be loger that 6 characters';
                                    } else if (value == null || value.isEmpty) {
                                      return 'password is Empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textFormField(
                                  keyboardType: TextInputType.number,
                                  labeltext: 'Confirm Password',
                                  controller: passwordConfirmController,
                                  validator: (value) {
                                    if (passwordController.text.length < 6) {
                                      return 'password must be loger that 6 characters';
                                    } else if (value == null || value.isEmpty) {
                                      return 'password is Empty';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: mediaQueryData.size.width,
                                  child: Row(
                                    children: [
                                      const Text('Already have an account? '),
                                      InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen(),
                                                ));
                                          },
                                          child: const Text(
                                            ' Login',
                                            style:
                                                TextStyle(color: Colors.blue),
                                          )),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textButton(
                                  mediaQueryData: mediaQueryData,
                                  text: 'Login',
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      RegisterCubit.get(context).baseRegaster(
                                        email: emailController.text,
                                        passwordConfirmation:
                                            passwordConfirmController.text,
                                        mobile: phoneNumperController.text,
                                        name: nameController.text,
                                        password: passwordController.text,
                                        context: context,
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Scaffold();
        }
        return const Scaffold();
      }),
    );
  }
}
