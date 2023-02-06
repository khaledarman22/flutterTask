import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? id;
  final String? name;
  final String? mobile;
  final String? email;
  final String? image;
  final String? token;

  const Data({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.image,
    this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        mobile: json['mobile'] as String?,
        email: json['email'] as String?,
        image: json['image'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'mobile': mobile,
        'email': email,
        'image': image,
        'token': token,
      };

  @override
  List<Object?> get props => [id, name, mobile, email, image, token];
}
