
import 'package:contest/models/ArticleModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class SqlBb{
  String? uid;
  SqlBb({required String uid});
  static Database? _database;
  Future<Database?> get database  async{
    if (_database==null) {
      _database = await initialDb();
      return _database;
    }else{
      return _database;
    }
  }



  initialDb()async{
    String path = join(await getDatabasesPath(),"news.db");
    Database database=await openDatabase(path,onCreate: _onCreate , version: 1,);
    return database;
  }
  _onCreate(Database db , int version)async{
    await db.execute('''
CREATE TABLE "news" (
  "userId" TEXT NOT NULL ,
  "id" INTEGER PRIMARY KEY AUTOINCREMENT ,
  "title" TEXT NOT NULL , 
  "desc" TEXT NOT NULL , 
  "imageUrl" TEXT NOT NULL ,
  "url" TEXT NOT NULL ,  
)
''');
  }
  
  readData(String sql)async{
    Database? myDb = await database;
    List<Map> response = await myDb!.rawQuery(sql);
    return response;
  }
  insertData(Article article)async{
    Database? myDb= await database;
    int response = await myDb!.insert("news", article.toMap(uid!),conflictAlgorithm: ConflictAlgorithm.replace);
    print("response = .......$response"  );
    return response;
  }
   updateData(String sql) async{
    
    Database? myDb= await database;
    int response = await myDb!.rawUpdate(sql);
    return response;
  }
   deleteData(String sql) async{
    Database? myDb= await database;
    int response = await myDb!.rawDelete(sql);
    return response;
  }

  deleteMyDb()async{
    deleteDatabase(join(await getDatabasesPath(),"news.db"));
  }
}