import 'package:posts/data/models/characters.dart';
import 'package:posts/data/web_services/characters_web_service.dart';

class CharactersRepository {
  final CharactersWebService charactersWebService;

  CharactersRepository(this.charactersWebService);

  Future<dynamic> fetchAllCharacters() async {
    final characters = await charactersWebService.getAllCharacters();
    return CharactersModel.fromJson(characters);
  }
}
