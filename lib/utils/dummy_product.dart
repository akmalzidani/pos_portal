class DummyProduct {
  String name;
  String harga;
  String stock;
  String terjual;

  DummyProduct({
    required this.name,
    required this.harga,
    required this.stock,
    required this.terjual,
  });
}

List <DummyProduct> listProduct = [
  DummyProduct(name: 'Teh Botol', harga: 'Rp 5.000', stock: '30', terjual: '2'),
  DummyProduct(name: 'Bola Plastik', harga: 'Rp 5.000', stock: '3', terjual: '4'),
  DummyProduct(name: 'Sampo Sachet', harga: 'Rp 1.000', stock: '50', terjual: '30'),
  DummyProduct(name: 'Sandal Jepit', harga: 'Rp 15.000', stock: '1', terjual: '9'),
  DummyProduct(name: 'Air Galon Isi Ulang', harga: 'Rp 5.000', stock: '5', terjual: '10'),
  DummyProduct(name: 'Es buah', harga: 'Rp 5.000', stock: '123456789', terjual: '20'),
];