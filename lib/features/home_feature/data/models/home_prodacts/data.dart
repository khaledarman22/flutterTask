import 'package:equatable/equatable.dart';

import 'product.dart';

class Data extends Equatable {
  final int? id;
  final String? name;
  final List<Product>? product;

  const Data({this.id, this.name, this.product});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        product: (json['product'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'product': product?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [id, name, product];
}
