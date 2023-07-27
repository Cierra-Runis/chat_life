import 'package:chat_life/index.dart';

class IpadWidget extends StatelessWidget {
  const IpadWidget({
    super.key,
    required this.ipadStatus,
    required this.currentApp,
  });

  final IpadStatus ipadStatus;
  final Widget currentApp;

  @override
  Widget build(BuildContext context) {
    return BasedDockScaffold(
      appBar: IpadStatusBarWidget(
        ipadStatus: ipadStatus,
      ),
      body: currentApp,
      dockChild: const Row(
        children: [],
      ),
    );
  }
}
