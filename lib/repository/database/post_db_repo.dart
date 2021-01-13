import 'package:sqflite/sqflite.dart';
import 'package:sqlite_clean/model/post_model.dart';

class PostsDbRepo {
  // Setup a singleton
  static final PostsDbRepo _postsDbRepo = PostsDbRepo._internal();
  factory PostsDbRepo() {
    return _postsDbRepo;
  }
  PostsDbRepo._internal();

  Database _database;

  // methods
  // init db
  Future<void> initDb() async {
    _database = await openDatabase('my_news.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        '''
          create table post ( 
            id integer primary key autoincrement, 
            title text not null,
            author text not null,
            description TEXT not null,
            url TEXT not null,
            urlToImage TEXT not null,
            publishedAt TEXT not null,
            content TEXT not null )
          ''',
      );
    });
  }

  Future<int> addArticle(Article article) async {
    int id = await _database.insert('post', article.toJson());
    return id;
  }

  Future<List<Article>> getAllArticles() async {
    List<Map<String, dynamic>> records = await _database.query('post');
    return List<Article>.from(records.map((x) => Article.fromJson(x)));
  }

  Future<void> terminate() async {
    await _database.close();
  }
}
