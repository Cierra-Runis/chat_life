import 'package:chat_life/index.dart';

class BasePageRouteWidget<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool linearTransition;

  BasePageRouteWidget({
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
