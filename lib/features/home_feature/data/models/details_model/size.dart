import 'package:equatable/equatable.dart';

class Size extends Equatable {
  final int? id;
  final String? name;

  const Size({this.id, this.name});

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json['id'] as int?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
