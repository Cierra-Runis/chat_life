import 'package:chat_life/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'local_store.g.dart';
part 'local_store.freezed.dart';

extension _Ext on Persistence {
  static const token = '${Persistence.prefix}_token';

  String? getToken() => sp.getString(token);
  Future<bool> setToken(String? value) async {
    if (value != null) return await sp.setString(token, value);
    return await sp.remove(token);
  }
}

@freezed
class LocalStoreState with _$LocalStoreState {
  const LocalStoreState._();

  const factory LocalStoreState({
    @JsonKey(name: _Ext.token) String? token,
  }) = _LocalStoreState;

  factory LocalStoreState.fromJson(Json json) =>
      _$LocalStoreStateFromJson(json);
}

@riverpod
class LocalStore extends _$LocalStore {
  late final Persistence _pers;

  @override
  LocalStoreState build() {
    _pers = ref.watch(persistenceProvider);
    return LocalStoreState(token: _pers.getToken());
  }

  Future<void> setToken(String? value) async {
    await _pers.setToken(value);
    state = state.copyWith(token: value);
  }
}
