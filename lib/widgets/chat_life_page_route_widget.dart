import 'package:chat_life/index.dart';

class ChatLifePageRouteWidget<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool linearTransition;

  ChatLifePageRouteWidget({
    required this.page,
    super.transitionDuration = const Duration(milliseconds: 500),
    this.linearTransition = false,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (
            context,
            animation,
            secondaryAnimation,
            child,
          ) {
            switch (animation.status) {
              case AnimationStatus.forward:
                return FadeTransition(opacity: animation, child: child);
              case AnimationStatus.reverse:
                return CupertinoPageTransition(
                  primaryRouteAnimation: animation,
                  secondaryRouteAnimation: secondaryAnimation,
                  linearTransition: linearTransition,
                  child: child,
                );
              default:
                return child;
            }
          },
        );
}
