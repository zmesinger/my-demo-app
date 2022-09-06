import 'package:english_words/english_words.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/bloc/word_pair_bloc.dart';

class Favorites extends StatefulWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WordPairBloc>(context).add(EventShowFavorites());
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WordPairBloc, WordPairState>(
      builder: (context, state) {
        Iterable<ListTile> tiles;
        if(state is StateFetchingData){
          return Scaffold(
            appBar: AppBar(
              title: const Text("Saved suggestions"),
            ),
            body: Center(
                child:
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(color: Colors.red,),
                  ],
                )),
          );
        }else if(state is StateDataFetched) {
          tiles = state.data.map(
                (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                ),
              );
            },
          );
        }else{
          return Container();
        }

        final divided = tiles.isNotEmpty
            ? ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList() : <Widget>[];
        return Scaffold(
          appBar: AppBar(
            title: const Text("Saved suggestions"),
          ),
          body: ListView(children: divided),
        );
      },
    );
  }


}
