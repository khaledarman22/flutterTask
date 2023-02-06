import 'package:equatable/equatable.dart';

import 'size.dart';

class Color extends Equatable {
  final int? id;
  final String? name;
  final String? hex;
  final List<Size>? size;

  const Color({this.id, this.name, this.hex, this.size});

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        id: json['id'] as int?,
        name: json['name'] as String?,
        hex: json['hex'] as String?,
        size: (json['Size'] as List<dynamic>?)
            ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'hex': hex,
        'Size': size?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, hex, size];
}
