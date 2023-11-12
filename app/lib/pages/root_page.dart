import 'package:chat_life/index.dart';

final splitViewKey = GlobalKey<NavigatorState>();

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  void _onDestinationSelected(int index) {
    setState(() => _currentIndex = index);
  }

  static const List<Widget> _bodyWidgets = [
    HomePage(key: ValueKey(HomePage)),
    ContactsPage(key: ValueKey(ContactsPage)),
    SpacePage(key: ValueKey(SpacePage)),
  ];

  @override
  Widget build(BuildContext context) {
    return BasedSplitView(
      splitMode: SplitMode.width,
      navigatorKey: splitViewKey,
      leftWidth: 364,
      breakPoint: 364 * 2,
      leftWidget: Scaffold(
        body: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _bodyWidgets[_currentIndex],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentIndex,
          onDestinationSelected: _onDestinationSelected,
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
      ),
      rightPlaceholder: const RightPlaceholder(),
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
        child: Image(
          image: AssetImage(
            'assets/images/app_icon.ico',
          ),
          width: 128,
        ),
      ),
    );
  }
}
