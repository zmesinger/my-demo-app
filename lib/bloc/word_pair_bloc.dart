import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:english_words/english_words.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'word_pair_event.dart';
part 'word_pair_state.dart';

class WordPairBloc extends Bloc<WordPairEvent, WordPairState> {

  final Set<WordPair> _saved = <WordPair>{};

  WordPairBloc() : super(WordPairInitial()) {
    on<EventToggleData>((event, emit) {

      if(_saved.contains(event.pair)){
        _saved.remove(event.pair);
      }else{
        _saved.add(event.pair);
      }
      print(_saved);
      emit(StateWordPairToggled(Set.from(_saved)));
    });
    on<EventShowFavorites>((event, emit) async {
      emit(StateFetchingData());
      await Future.delayed(Duration(seconds: 3));
      emit(StateDataFetched(Set.from(_saved)));
    });
  }

}
