class CategoryEntity {
  final String name;

  CategoryEntity({required this.name});

  //Bussiness rules related to category

  //1. To check if no other category is identical to current object.
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryEntity && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
