import 'package:flutter/material.dart';
import 'package:sqlite_clean/pages/home.dart';
import 'package:sqlite_clean/repository/database/post_db_repo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  PostsDbRepo _postsDbRepo = PostsDbRepo();
  _postsDbRepo.initDb();
  runApp(
    MyApp(
      postsDbRepo: _postsDbRepo,
    ),
  );
}

class MyApp extends StatefulWidget {
  final PostsDbRepo postsDbRepo;

  const MyApp({Key key, @required this.postsDbRepo}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }

  @override
  void dispose() {
    print("Closing appppp");
    widget.postsDbRepo.terminate();
    super.dispose();
  }
}
