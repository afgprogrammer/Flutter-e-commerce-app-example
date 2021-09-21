class Product {
  final String name;
  final String brand;
  final String imageURL;
  final int price;

  Product(this.name, this.brand, this.imageURL, this.price);

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
      json["name"],
      json["brand"],
      json["imageURL"],
      json["price"]
    );
  }
}
