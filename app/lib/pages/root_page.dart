import 'package:chat_life/index.dart';

final splitViewKey = GlobalKey<NavigatorState>();

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: '再次返回以退出',
      background: context.colorScheme.outline.withAlpha(16),
      backgroundRadius: BorderRadius.circular(16),
      condition: _currentIndex == 0,
      onConditionFail: () => _onDestinationSelected(0),
      child: BasedSplitView(
        splitMode: SplitMode.width,
        navigatorKey: splitViewKey,
        leftWidget: RootPage(
          currentIndex: _currentIndex,
          onDestinationSelected: _onDestinationSelected,
        ),
        leftWidth: 364,
        breakPoint: 364 * 2,
        rightPlaceholder: const Scaffold(
          body: Center(),
        ),
      ),
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final void Function(int) onDestinationSelected;

  static const List<Widget> _bodyWidgets = [
    HomePage(key: ValueKey(HomePage)),
    ContactsPage(key: ValueKey(ContactsPage)),
    SpacePage(key: ValueKey(SpacePage)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: _bodyWidgets[currentIndex],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onDestinationSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.message_rounded),
            label: '消息',
          ),
          NavigationDestination(
            icon: Icon(Icons.people_rounded),
            label: '联系人',
          ),
          NavigationDestination(
            icon: Icon(Icons.public_rounded),
            label: '空间',
          ),
        ],
      ),
    );
  }
}
