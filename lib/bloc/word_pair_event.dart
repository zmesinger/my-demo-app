part of 'word_pair_bloc.dart';

@immutable
abstract class WordPairEvent extends Equatable{}

class EventToggleData extends WordPairEvent{
  final WordPair pair;

  EventToggleData(this.pair);

  @override
  List<Object?> get props => [pair];
}

class EventShowFavorites extends WordPairEvent{
  @override
  List<Object?> get props => [];

}


