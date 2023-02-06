import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? name;
  final String? image;
  final int? price;
  final int? oldprice;

  const Product({
    this.id,
    this.name,
    this.image,
    this.price,
    this.oldprice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        oldprice: json['oldprice'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'oldprice': oldprice,
      };

  @override
  List<Object?> get props => [id, name, image, price, oldprice];
}
