import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/core/functions/get_device_type.dart';
import 'package:fluttertask/core/utils/enums/device_type.dart';
import 'package:fluttertask/core/widgets/const_loding_circul.dart';
import 'package:fluttertask/core/widgets/const_text_bottom.dart';
import 'package:fluttertask/core/widgets/const_text_form_feld.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/login_cubit/login_state.dart';
import 'package:fluttertask/features/auth_feature/presentation/view/regester_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
        if (state is LoginStateLoding) {
          return const LodingCircul();
        }
        if (state is LoginInitial) {
          return getDeviceType(mediaQueryData) == DeviceType.mobile
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: mediaQueryData.size.width,
                        height: mediaQueryData.size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textFormField(
                              labeltext: 'Email',
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
                                //todo change > to <
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
                                  const Text('Don\'t have an account? '),
                                  InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  RegesterScreen(),
                                            ));
                                      },
                                      child: const Text(
                                        'Regester an account',
                                        style: TextStyle(color: Colors.blue),
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
                                  LoginCubit.get(context).baseLogin(
                                      context: context,
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Scaffold();
        }
        return const Scaffold();
      }),
    );
  }
}
