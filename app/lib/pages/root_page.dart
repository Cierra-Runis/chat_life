import 'package:chat_life/index.dart';

final splitViewKey = GlobalKey<NavigatorState>();

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasedSplitView(
      splitMode: SplitMode.width,
      navigatorKey: splitViewKey,
      leftWidget: const LeftWidget(),
      rightPlaceholder: const RightPlaceholder(),
    );
  }
}

class LeftWidget extends StatefulWidget {
  const LeftWidget({
    super.key,
  });

  @override
  State<LeftWidget> createState() => _LeftWidgetState();
}

class _LeftWidgetState extends State<LeftWidget> {
  static const _destinationModel = _NavigationDestinationModel(
    destinations: [
      NavigationDestination(
        icon: Icon(Icons.message_rounded),
        label: '消息',
      ),
      NavigationDestination(
        icon: Icon(Icons.group_rounded),
        label: '联系人',
      ),
      NavigationDestination(
        icon: Icon(Icons.public_rounded),
        label: '空间',
      ),
    ],
    bodies: [
      HomePage(key: ValueKey(HomePage)),
      ContactsPage(key: ValueKey(ContactsPage)),
      SpacePage(key: ValueKey(SpacePage)),
    ],
  );

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _destinationModel.bodies[_currentIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onItemTapped,
        destinations: _destinationModel.destinations,
      ),
    );
  }
}

class RightPlaceholder extends StatelessWidget {
  const RightPlaceholder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ChatLifeIcon(),
      ),
    );
  }
}

class _NavigationDestinationModel {
  const _NavigationDestinationModel({
    required this.destinations,
    required this.bodies,
  });
  final List<NavigationDestination> destinations;
  final List<Widget> bodies;
}
