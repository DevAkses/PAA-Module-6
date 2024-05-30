class Cart {
  final int id;
  final String title;
  final int price;
  final double quantity;
  final double discountPercentage;
  final double discountedPrice;
  final String thumbnail;

  Cart(
      {required this.id,
      required this.title,
      required this.price,
      required this.quantity,
      required this.discountedPrice,
      required this.discountPercentage,
      required this.thumbnail});

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      quantity: json['quantity'],
      discountPercentage: json['discountPercentage'],
      discountedPrice: json['discountedPrice'],
      thumbnail: json['thumbnail'],
    );
  }
}
