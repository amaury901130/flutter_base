import 'package:domain/repo/abstract/character_repo.dart';
import 'package:domain/services/abstract/character_service.dart';
import 'package:domain/services/notifiers/_characters_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain/models/character.dart';

class CharacterServiceImp implements CharacterService {
  // Simple Notifier without state management.
  @override
  StateNotifierProvider<CharacterNotifier, List<Character?>?>
      simpleNotifierCharactersProvider =
      StateNotifierProvider<CharacterNotifier, List<Character?>?>(
    (ref) => CharacterNotifier(
      ref.read,
      List.empty(),
    ),
  );

  // Notifier with state management, onError, onLoading, onData
  @override
  StateNotifierProvider<CharacterNotifierAsync, AsyncValue<List<Character?>?>>
      asyncCharactersProvider = StateNotifierProvider<CharacterNotifierAsync,
          AsyncValue<List<Character?>?>>(
    (ref) => CharacterNotifierAsync(
      ref.read,
      AsyncValue<List<Character?>?>.data(List.empty()),
    ),
  );

  // Single call.
  // Future and Stream providers have state management, onError, onLoading, onData
  @override
  AutoDisposeFutureProvider<List<Character?>?> futureCharactersProvider =
      FutureProvider.autoDispose((ref) async {
    // Do something when dispose
    // ref.onDispose(() => { });
    final characters = await CharacterRepo.instance.loadCharacters();
    // If the request completed successfully, keep the state, you can get the value later in any place
    ref.maintainState = true;
    return characters;
  });

  @override
  void nextPage(WidgetRef reader) {
    reader.read(simpleNotifierCharactersProvider.notifier).loadMore();
    reader.read(asyncCharactersProvider.notifier).loadMore();
  }
}
