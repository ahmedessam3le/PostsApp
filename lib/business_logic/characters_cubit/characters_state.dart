part of 'characters_cubit.dart';

@immutable
abstract class CharactersStates {}

class CharactersInitialState extends CharactersStates {}

class CharactersLoadingState extends CharactersStates {}

class CharactersLoadedState extends CharactersStates {
  // final CharactersModel characters;
  //
  // CharactersLoadedState(this.characters);
}

class CharactersErrorState extends CharactersStates {
  final String errorMessage;

  CharactersErrorState({required this.errorMessage});
}

// class PostsLoaded extends CharactersStates {
//   final List<Post> characterPosts;
//
//   PostsLoaded(this.characterPosts);
// }
