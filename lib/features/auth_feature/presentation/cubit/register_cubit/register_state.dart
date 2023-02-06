import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class RegisterState extends Equatable {}

class RegisterInitial extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterStateLoding extends RegisterState {
  @override
  List<Object?> get props => [];
}

class RegisterStateErorr extends RegisterState {
  final String erorrMasseg;

  RegisterStateErorr({
    required this.erorrMasseg,
  });
  @override
  List<Object?> get props => [
        erorrMasseg,
      ];
}

// class RegisterStateLoded extends RegisterState {
//   final List<AuthModel> authData;
//   RegisterStateLoded({
//     required this.authData,
//   });
//   @override
//   List<Object?> get props => [
//         authData,
//       ];
// }
