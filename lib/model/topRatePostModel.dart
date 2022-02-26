class TopRatePostModel {
  TopRatePostModel({
    required this.id,
    required this.productName,
    required this.price,
    required this.unit,
    required this.image,
    required this.createdAt,
    required this.categoryName,
    required this.factoryName,
    required this.userName,
  });

  String id;
  String categoryName;
  String productName;
  String userName;
  String price;
  String unit;
  String image;
  String factoryName;
  DateTime createdAt;
}
