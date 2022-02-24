

class GetAllPostModel {
    GetAllPostModel({
        required this.id,
        required this.categoryId,
        required this.productId,
        required this.userId,
        required this.price,
        required this.unit,
        required this.image,
        required this.description,
        required this.address,
        required this.specialOffer,
        required this.createdAt,
        required this.updatedAt,
    });

    int id;
    String categoryId;
    String productId;
    String userId;
    String price;
    String unit;
    dynamic image;
    String description;
    String address;
    String specialOffer;
    DateTime createdAt;
    DateTime updatedAt;

 
}
