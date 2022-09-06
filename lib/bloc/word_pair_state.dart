part of 'word_pair_bloc.dart';

@immutable
abstract class WordPairState extends Equatable {}

class WordPairInitial extends WordPairState {
  @override
  List<Object?> get props => [];
}

class StateWordPairToggled extends WordPairState{
  final Set<WordPair> savedData;

  StateWordPairToggled(this.savedData);

  @override
  List<Object?> get props => [savedData];

}

class StateFetchingData extends WordPairState{
  @override
  List<Object?> get props => [];
}

class StateDataFetched extends WordPairState{
  final Set<WordPair> data;

  StateDataFetched(this.data);

  @override
  List<Object?> get props => [data];

}