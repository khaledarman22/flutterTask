import 'package:flutter/material.dart';
import 'package:fluttertask/core/cache_helper.dart';
import 'package:fluttertask/features/auth_feature/data/repo_impel/auth_repo_impel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/login_cubit/login_state.dart';
import 'package:fluttertask/features/home_feature/presentation/view/home_screen.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepoImpel}) : super(LoginInitial());
  AuthRepoImpel authRepoImpel;
  static LoginCubit get(context) => BlocProvider.of(context);

  void baseLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    emit(LoginStateLoding());
    await authRepoImpel
        .baseLogin(mobile: email, password: password)
        .then((resalt) {
      resalt.fold((failure) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(failure.errMassage),
        ));

        emit(LoginInitial());
      }, (authModel) {
        CacheHelper.cachData(key: 'token', value: authModel.data!.token);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(authModel.message!),
        ));

        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      });
    });
  }
}
