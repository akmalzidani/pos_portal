import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBConfig {
  static final DBConfig instance = DBConfig._init();

  static Database? _database;

  DBConfig._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('pos.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    // Product Table
    await db.execute('''
      CREATE TABLE Product(
        id INTEGER PRIMARY KEY,
        item_code TEXT NOT NULL,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        stock_type TINYINT NOT NULL DEFAULT 0,
        stock INTEGER NOT NULL,
        created_time TEXT NOT NULL,
        updated_time TEXT NOT NULL
      )
    ''');
    // - stock_type: 0 = unlimited, 1 = limited

    // Transaction Table
    await db.execute('''
      CREATE TABLE TransactionRecord(
        id INTEGER PRIMARY KEY,
        nominal_payment REAL NOT NULL,
        total REAL NOT NULL,
        change REAL NOT NULL,
        discType TINYINT NOT NULL,
        discValue REAL NOT NULL,
        created_time TEXT NOT NULL,
        updated_time TEXT NOT NULL
      )
    ''');

    // Transaction Detail Table
    await db.execute('''
      CREATE TABLE Transaction_Detail(
        id INTEGER PRIMARY KEY,
        transaction_id INTEGER NOT NULL,
        product_id INTEGER NOT NULL,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL,
        status TINYINT NOT NULL DEFAULT 0,
        FOREIGN KEY (transaction_id) REFERENCES TransactionRecord(id) ON DELETE CASCADE,
        FOREIGN KEY (product_id) REFERENCES Product(id) ON DELETE CASCADE
      )
    ''');
    // - status: 0 = pending, 1 = success, 2 = failed

    // Setting Table
    await db.execute('''
      CREATE TABLE Setting(
        id INTEGER PRIMARY KEY,
        name TEXT NOT NULL,
        value TEXT NOT NULL,
        created_time TEXT NOT NULL,
        updated_time TEXT NOT NULL
      )
    ''');

    await db.execute('''
      INSERT INTO Product (item_code, name, price, stock_type, stock, created_time, updated_time)
      VALUES ('P001', 'Product 1', 10000, 0, 100, '2021-01-01 00:00:00', '2021-01-01 00:00:00'),
             ('P002', 'Product 2', 20000, 0, 100, '2021-01-01 00:00:00', '2021-01-01 00:00:00'),
             ('P003', 'Product 3', 30000, 0, 100, '2021-01-01 00:00:00', '2021-01-01 00:00:00'),
             ('P004', 'Product 4', 40000, 0, 100, '2021-01-01 00:00:00', '2021-01-01 00:00:00'),
             ('P005', 'Product 5', 50000, 0, 100, '2021-01-01 00:00:00', '2021-01-01 00:00:00')
    ''');
  }
}