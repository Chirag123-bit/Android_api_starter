import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? description;
  String? richDescription;
  String? price;
  String? image;
  String? brand;
  String? category;
  int? countInStock;
  int? rating;
  int? numReviews;
  bool? isFeatured;

  Product({
    this.id,
    this.name,
    this.description,
    this.richDescription,
    this.price,
    this.image,
    this.brand,
    this.category,
    this.countInStock,
    this.rating,
    this.numReviews,
    this.isFeatured,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
