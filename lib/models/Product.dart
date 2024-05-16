class Product {
  int? id;
  final String itemCode;
  final String name;
  final double price;
  final int stockType;
  final int stock;

  Product({
    this.id,
    required this.itemCode,
    required this.name,
    required this.price,
    required this.stockType,
    required this.stock,
  });

  factory Product.fromMap(Map<String, dynamic> data) => Product(
    id: data['id'],
    itemCode: data['item_code'],
    name: data['name'],
    price: data['price'],
    stockType: data['stock_type'],
    stock: data['stock'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'item_code': itemCode,
    'name': name,
    'price': price,
    'stock_type': stockType,
    'stock': stock,
  };
}