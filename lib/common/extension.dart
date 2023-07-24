import 'package:chat_life/index.dart';

extension DateTimeExtension on DateTime {
  bool get isDay => isAfter(copyWith(hour: 6)) && isBefore(copyWith(hour: 18));

  Brightness get brightness => isDay ? Brightness.light : Brightness.dark;
}

extension NumExtension on num {
  bool between(num a, num b) => a < this && this < b;
}

extension GlobalNavigatorKeyExtension on GlobalKey<NavigatorState> {
  bool canPop() => currentState?.canPop() == false;

  Future<T?> push<T extends Object?>(Widget page) async =>
      currentState?.push(MaterialPageRoute(builder: (context) => page));

  Future<T?> pushBase<T extends Object?>(Widget page) async =>
      currentState?.push(BasePageRouteWidget(page: page));

  Future<T?> pushCupertino<T extends Object?>(Widget page) async =>
      currentState?.push(CupertinoPageRoute(builder: (context) => page));

  Future<T?> pushBaseReplace<T extends Object?, TO extends Object?>(
    Widget page, {
    TO? result,
  }) async =>
      currentState?.pushReplacement(
        BasePageRouteWidget(page: page),
        result: result,
      );

  void popToRoot() => currentState?.popUntil((route) => route.isFirst);

  Future<T?> popupModalBottomSheet<T>(Widget sheet) async {
    if (currentContext == null) return null;
    return showModalBottomSheet(
      context: currentContext!,
      showDragHandle: true,
      builder: (context) => sheet,
    );
  }
}
