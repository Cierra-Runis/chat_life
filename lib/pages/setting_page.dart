import 'package:chat_life/index.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: chatLifeSubAppGlobalKey.popToRoot,
        ),
        title: const Text('设置'),
      ),
    );
  }
}
