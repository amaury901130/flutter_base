import 'package:domain/models/character.dart';
import 'package:domain/repo/abstract/character_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterNotifier extends StateNotifier<List<Character?>?> {
  CharacterNotifier(this.reader, this.characters) : super(characters) {
    loadMore();
  }

  // Use this reader to manage/update other providers.
  Reader reader;
  List<Character?>? characters;

  Future<void> loadMore() async {
    state = List.empty();
    final nextItems = await CharacterRepo.instance.loadCharacters();
    characters = nextItems!.toList();
    state = nextItems;
  }
}

class CharacterNotifierAsync
    extends StateNotifier<AsyncValue<List<Character?>?>> {
  CharacterNotifierAsync(this.reader, this.characters) : super(characters) {
    loadMore();
  }

  // Use this reader to manage/update other providers.
  Reader reader;
  AsyncValue<List<Character?>?> characters;

  Future<void> loadMore() async {
    // Change the sate to loading.
    state = AsyncValue.loading();
    final nextItems = await CharacterRepo.instance.loadCharacters();
    characters = AsyncValue.data(nextItems);
    // Notify the data.
    state = characters;
  }
}
