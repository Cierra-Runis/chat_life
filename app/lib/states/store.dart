import 'package:chat_life/index.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'store.g.dart';
part 'store.freezed.dart';

extension _Ext on Persistence {
  static const token = '${Persistence.prefix}_token';

  String? getToken() => sp.getString(token);
  Future<bool> setToken(String? value) async {
    if (value != null) return await sp.setString(token, value);
    return await sp.remove(token);
  }
}

@freezed
class StoreState with _$StoreState {
  const StoreState._();

  const factory StoreState({
    @JsonKey(name: _Ext.token) String? token,
  }) = _StoreState;

  factory StoreState.fromJson(Json json) => _$StoreStateFromJson(json);
}

@riverpod
class Store extends _$Store {
  late final Persistence _pers;

  @override
  StoreState build() {
    _pers = ref.watch(persistenceProvider);
    return StoreState(token: _pers.getToken());
  }

  Future<void> setToken(String? value) async {
    await _pers.setToken(value);
    state = state.copyWith(token: value);
  }
}
