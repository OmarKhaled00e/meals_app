import 'package:meals_app/features/home/data/models/meal_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._internal();

  factory DbHelper() => instance;

  DbHelper._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_database.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        description TEXT,
        time TEXT,
        imageUrl TEXT,
        rate REAL
      )
    ''');
  }

  Future<int> insertMeal(MealModel meal) async {
    final db = await database;
    return await db.insert('meals', meal.toMap());
  }

  Future<List<MealModel>> getMeals() async {
    final db = await database;
    final List<Map<String, dynamic>> mealsJson = await db.query('meals');
    return mealsJson.map((json) => MealModel.fromMap(json)).toList();
  }
}
