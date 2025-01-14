import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../../../../data/models/registration_model.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'registration.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      // Drop the old table
      await db.execute('DROP TABLE IF EXISTS registrations');

      // Create the new table with updated schema
      await _onCreate(db, newVersion);
    }
  }


  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE registrations (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT NOT NULL,
        lastName TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL,
        experience TEXT NOT NULL,
        mobileNumber TEXT NOT NULL,
        yearOfPassing INTEGER NOT NULL,
        grade TEXT NOT NULL,
        address TEXT NOT NULL,
        zipCode TEXT NOT NULL,
        designation TEXT NOT NULL,
        domain TEXT NOT NULL,
        city TEXT NOT NULL,
        landmark TEXT NOT NULL
      )
    ''');
  }

  // Insert Registration Data
  Future<int> insertRegistration(RegistrationModel registration) async {
    final db = await database;
    return await db.insert(
      'registrations',
      registration.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve All Registrations (Optional)
  Future<List<RegistrationModel>> getAllRegistrations() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('registrations');

    return List.generate(maps.length, (i) {
      return RegistrationModel.fromMap(maps[i]);
    });
  }

  // Clear All Registrations (Optional)
  Future<void> clearAllRegistrations() async {
    final db = await database;
    await db.delete('registrations');
  }
}

