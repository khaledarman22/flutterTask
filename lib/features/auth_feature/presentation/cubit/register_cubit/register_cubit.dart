import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertask/features/auth_feature/data/repo_impel/auth_repo_impel.dart';
import 'package:fluttertask/features/auth_feature/presentation/cubit/register_cubit/register_state.dart';
import 'package:fluttertask/features/auth_feature/presentation/view/login_screen.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required this.authRepoImpel,
  }) : super(RegisterInitial());
  final AuthRepoImpel authRepoImpel;
  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> baseRegaster(
      {required String email,
      required String passwordConfirmation,
      required String mobile,
      required String name,
      required String password,
      required BuildContext context}) async {
    emit(
      RegisterStateLoding(),
    );
    authRepoImpel
        .baseRegaster(
      email: email,
      passwordConfirmation: passwordConfirmation,
      mobile: mobile,
      name: name,
      password: password,
    )
        .then((resalt) {
      resalt.fold((failure) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(failure.errMassage)));
        emit(RegisterInitial());
      }, (authModel) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(authModel.message!),
        ));
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    });
  }
}
