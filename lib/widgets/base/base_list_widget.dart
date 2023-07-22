import 'package:chat_life/index.dart';

class BaseListWidget extends StatelessWidget {
  final EdgeInsets? padding;
  final List<Widget> children;
  final bool shrinkWrap;

  const BaseListWidget({
    super.key,
    this.padding,
    this.children = const <Widget>[],
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: padding ?? const EdgeInsets.only(top: 8),
      shrinkWrap: shrinkWrap,
      children: children,
    );
  }
}
