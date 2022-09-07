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


    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved suggestions"),
      ),
      body: BlocBuilder<WordPairBloc, WordPairState>(
        builder: (context, state) {

          if(state is StateFetchingData){
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: Colors.red,),
                ],
              ),
            );
          }else if(state is StateDataFetched){
            Iterable<ListTile> tiles;
            tiles = state.data.map((pair) =>
            ListTile(title: Text(pair.asPascalCase),));
            final divided = tiles.isNotEmpty
                ? ListTile.divideTiles(
              context: context,
              tiles: tiles,
            ).toList() : <Widget>[];
            return ListView(children: divided);
          }else{
            return Container();
          }
        },
      ),
    );
  }


}
