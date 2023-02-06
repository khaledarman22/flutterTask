import 'package:equatable/equatable.dart';

class MoreImage extends Equatable {
  final int? id;
  final String? image;
  final String? hex;

  const MoreImage({this.id, this.image, this.hex});

  factory MoreImage.fromJson(Map<String, dynamic> json) => MoreImage(
        id: json['id'] as int?,
        image: json['image'] as String?,
        hex: json['hex'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'hex': hex,
      };

  @override
  List<Object?> get props => [id, image, hex];
}
