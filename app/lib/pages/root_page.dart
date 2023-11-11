import 'package:chat_life/index.dart';

final splitViewKey = GlobalKey<NavigatorState>();

class RootView extends StatefulWidget {
  const RootView({super.key});

  @override
  State<RootView> createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return DoubleBack(
      message: '再次返回以退出',
      background: context.colorScheme.outline.withAlpha(16),
      backgroundRadius: BorderRadius.circular(16),
      condition: _currentIndex == 0,
      onConditionFail: () => _onItemTapped(0),
      child: BasedSplitView(
        splitMode: SplitMode.width,
        navigatorKey: splitViewKey,
        leftWidget: RootPage(
          currentIndex: _currentIndex,
          onItemTapped: _onItemTapped,
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
    required this.onItemTapped,
  });

  final int currentIndex;
  final void Function(int) onItemTapped;

  static const List<Widget> _bodyWidgets = [
    Scaffold(key: ValueKey('HomePage')),
    Scaffold(key: ValueKey('MorePage')),
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
        onDestinationSelected: onItemTapped,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_rounded),
            label: '主页',
          ),
          NavigationDestination(
            icon: Icon(Icons.more_rounded),
            label: '更多',
          ),
        ],
      ),
    );
  }
}
