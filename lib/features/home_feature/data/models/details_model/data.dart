import 'package:equatable/equatable.dart';

import 'color.dart';
import 'more_image.dart';

class Data extends Equatable {
  final int? id;
  final String? name;
  final String? category;
  final String? description;
  final String? image;
  final int? price;
  final int? oldprice;
  final int? favourite;
  final int? discount;
  final int? priceAfterDiscount;
  final List<MoreImage>? moreImage;
  final List<Color>? color;

  const Data({
    this.id,
    this.name,
    this.category,
    this.description,
    this.image,
    this.price,
    this.oldprice,
    this.favourite,
    this.discount,
    this.priceAfterDiscount,
    this.moreImage,
    this.color,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        category: json['category'] as String?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        price: json['price'] as int?,
        oldprice: json['oldprice'] as int?,
        favourite: json['favourite'] as int?,
        discount: json['discount'] as int?,
        priceAfterDiscount: json['price_after_discount'] as int?,
        moreImage: (json['MoreImage'] as List<dynamic>?)
            ?.map((e) => MoreImage.fromJson(e as Map<String, dynamic>))
            .toList(),
        color: (json['Color'] as List<dynamic>?)
            ?.map((e) => Color.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'description': description,
        'image': image,
        'price': price,
        'oldprice': oldprice,
        'favourite': favourite,
        'discount': discount,
        'price_after_discount': priceAfterDiscount,
        'MoreImage': moreImage?.map((e) => e.toJson()).toList(),
        'Color': color?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      category,
      description,
      image,
      price,
      oldprice,
      favourite,
      discount,
      priceAfterDiscount,
      moreImage,
      color,
    ];
  }
}
