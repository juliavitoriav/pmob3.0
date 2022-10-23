import 'package:list/Banco/bd_helper.dart';
import 'package:list/Domain/user.dart';
import 'package:sqflite/sqflite.dart';

class UserDao {
  get dbhelper => null;

  get email => null;

  get username => null;

  get password => null;

  salvarUser({required User user}) async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbhelper.initDB();

    String sql =
        'SELECT * FROM login WHERE username =? AND email =? AND password =?;';
    var result = await db.rawQuery(sql, [username, email, password]);
    return result.isNotEmpty;
  }

  listaUsers() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM login;';
    var result = await db.rawQuery(sql);

    List<User> lista = <User>[];
    for (var json in result) {
      User user = User.fromJson(json);
      lista.add(user);
    }

    return lista;
  }
}

class DBHelper {
  initDB() {}
}
