class OrderDetails {
  final String product;
  final double price;
  final int quantity;
  final double subtotal;

  OrderDetails({
    required this.product,
    required this.price,
    required this.quantity,
  }) : subtotal = price * quantity;

  double get total => subtotal;

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'price': price,
      'quantity': quantity,
      'subtotal': subtotal,
    };
  }

  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      product: json['product'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}
