import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/data/models/characters.dart';
import 'package:posts/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersStates> {
  final CharactersRepository charactersRepository;
  CharactersModel? allCharacters;

  CharactersCubit(this.charactersRepository) : super(CharactersInitialState());

  static CharactersCubit of(BuildContext context) => BlocProvider.of(context);

  void retrieveAllCharacters() {
    emit(CharactersLoadingState());
    charactersRepository.fetchAllCharacters().then((characters) {
      allCharacters = characters;
    });
    emit(CharactersLoadedState());
  }

  // List<Post> retrieveCharacterPosts(int userId) {
  //   List<Post> finalPosts = [];
  //   charactersRepository.fetchCharacterQuotes(userId).then(
  //     (posts) {
  //       emit(PostsLoaded(posts));
  //       finalPosts = posts;
  //     },
  //   );
  //
  //   return finalPosts;
  // }
}
