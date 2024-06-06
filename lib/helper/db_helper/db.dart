import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';

enum CartColumn {
  id,
  title,
  description,
  category,
  price,
  discountPercentage,
  brand,
  warrantyInformation,
  availabilityStatus,
  returnPolicy,
  thumbnail,
}

enum LoginColumn { id, email, password }

class DataBase {
  DataBase._();

  static final DataBase db = DataBase._();
  Logger logger = Logger();

  late DataBase cartdb;
  late DataBase like;
  late DataBase user;

  String myDatabase = 'my_database.db';

  String cartTable = 'cart_table';
  String likeTable = 'like_table';
  String userTable = 'user_table';

  Future<void> initDb() async {
    String path = await getDatabasesPath();

    cartdb = (
      await openDatabase("$cartTable/$path", version: 1,
          onCreate: (db, version) {
        String sql = """CREATE TABLE IF IT EXISTS $cartTable (
        ${CartColumn.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CartColumn.title.name} TEXT,
        ${CartColumn.description.name} TEXT,
        ${CartColumn.category.name} TEXT,
        ${CartColumn.price.name} DOUBLE,
        ${CartColumn.discountPercentage.name} DOUBLE,
        ${CartColumn.brand.name} TEXT,
        ${CartColumn.warrantyInformation.name} TEXT,
        ${CartColumn.availabilityStatus.name} TEXT,
        ${CartColumn.returnPolicy.name} TEXT,
        ${CartColumn.thumbnail.name} TEXT
        );""";
        db
            .execute(sql)
            .then((value) => logger.i('cart table successfully created'))
            .onError((e, s) => logger.e("Cart table:  ${e.toString()}"));
      }, onUpgrade: (db, v1, v2) {}, onDowngrade: (db, v1, v2) {}),
    ) as DataBase;

    like = (
      await openDatabase(
        "$likeTable/$path",
        version: 1,
        onCreate: (db, version) {
          String sql = """CREATE TABLE IF IT EXISTS $likeTable (
        ${CartColumn.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${CartColumn.title.name} TEXT,
        ${CartColumn.description.name} TEXT,
        ${CartColumn.category.name} TEXT,
        ${CartColumn.price.name} DOUBLE,
        ${CartColumn.discountPercentage.name} DOUBLE,
        ${CartColumn.brand.name} TEXT,
        ${CartColumn.warrantyInformation.name} TEXT,
        ${CartColumn.availabilityStatus.name} TEXT,
        ${CartColumn.returnPolicy.name} TEXT,
        ${CartColumn.thumbnail.name} TEXT
        );""";
          db
              .execute(sql)
              .then((value) => logger.i('like table successfully created'))
              .onError((e, s) => logger.e("like table:  ${e.toString()}"));
        },
      ),
    ) as DataBase;
    user = await openDatabase("$likeTable/$path", version: 1,
        onCreate: (db, version) {
      String sql = """CREATE TABLE IF NOT EXISTS $userTable 
            (${LoginColumn.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${LoginColumn.email.name} TEXT UNIQUE NOT NULL,
             ${LoginColumn.password.name} TEXT NOT NULL);""";

      db
          .execute(sql)
          .then((value) => logger.i('user table successfully created'))
          .onError((e, s) => logger.e("user table:  ${e.toString()}"));
    }) as DataBase;
  }
}
