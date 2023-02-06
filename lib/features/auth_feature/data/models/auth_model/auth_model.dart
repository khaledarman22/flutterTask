import 'package:equatable/equatable.dart';

import 'data.dart';

class AuthModel extends Equatable {
  final bool? success;
  final String? message;
  final Data? data;

  const AuthModel({
    this.success,
    this.message,
    this.data,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json['success'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'data': data?.toJson(),
      };

  @override
  List<Object?> get props => [
        success,
        message,
        data,
      ];
}
