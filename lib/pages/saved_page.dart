import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_clean/cubit/favourite_cubit/favourite_cubit.dart';
import 'package:sqlite_clean/model/post_model.dart';

class SavedPosts extends StatelessWidget {
  const SavedPosts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is FavouriteInitial) {}
        if (state is FavouriteError) {}
        if (state is FavouriteSuccess) {
          List<Article> _articles = state.articles;
          if (_articles.isEmpty) {
            return Center(child: Text("No data"));
          }
          return buildListView(_articles);  
        }

        return Container();
      },
    );
  }

  Widget buildListView(List<Article> _articles) {
    return ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, index) {
        Article _articleItem = _articles[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 3,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints.expand(
                          height: MediaQuery.of(context).size.height * 0.25,
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        child: Image.network(
                          _articleItem.urlToImage ??
                              "https://accommodation.tripura.gov.in/Images2/LodgeImage/NoImageAvailable.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Flexible(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _articleItem.title ?? "No title",
                          style: Theme.of(context).textTheme.headline6,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Text(
                          _articleItem.description ?? "No desc",
                        ),
                        SizedBox(height: 5),
                        Text(
                          "By ${_articleItem.author}",
                          style: Theme.of(context).textTheme.caption,
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.open_in_browser,
                                  color: Colors.blueGrey,
                                ),
                                onPressed: () {},
                              ),
                              
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

}
