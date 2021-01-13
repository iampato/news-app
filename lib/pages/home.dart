import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_clean/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:sqlite_clean/cubit/post_cubit/post_cubit.dart';
import 'package:sqlite_clean/pages/posts_page.dart';
import 'package:sqlite_clean/pages/saved_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            PostCubit postCubit = PostCubit();
            return postCubit..fetchArticles();
          },
        ),
        BlocProvider(
          create: (context) {
            FavouriteCubit favouriteCubit = FavouriteCubit();
            return favouriteCubit..fetchSavedArticles();
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Post'),
              Tab(text: 'Saved'),
            ],
          ),
          elevation: 0,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            PostPage(),
            SavedPosts(),
          ],
        ),
      ),
    );
  }
}
