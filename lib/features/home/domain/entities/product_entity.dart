import 'package:browse_it/features/home/domain/entities/rating_entity.dart';

class ProductEntity {
  final int id;
  final double price;
  final String title, description, image, category;
  final RatingEntity rating;

  ProductEntity(
      {required this.id,
      required this.price,
      required this.title,
      required this.category,
      required this.description,
      required this.image,
      required this.rating});

  //Bussiness rules related to product

  //1. To check if no other product is identical to current object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductEntity &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image;
  }

  //2. to check if the title or desciption or any other important field is empty
  bool isTitleEmpty() => title.isEmpty;

  bool isDescriptionEmpty() => description.isEmpty;

  bool isImageUrlEmpty() => image.isEmpty;

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode ^ description.hashCode ^ image.hashCode;
}
