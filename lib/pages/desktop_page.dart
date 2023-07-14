import 'package:chat_life/index.dart';

class DesktopPage extends StatelessWidget {
  const DesktopPage({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('assets/images/desktop.png'),
          ),
        ),
        child: Column(
          children: [
            StatusBarWidget(dateTime: dateTime),
            Expanded(
              child: SaveViewWidget(
                dateTime: dateTime,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
