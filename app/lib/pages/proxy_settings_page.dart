import 'package:chat_life/index.dart';

class ProxySettingsPage extends ConsumerWidget {
  const ProxySettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.read(settingsProvider);
    final setSettings = ref.watch(settingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('代理设置'),
      ),
      body: BasedListView(
        children: [
          TextField(
            controller: TextEditingController(text: settings.apiBaseUrl),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'apiBaseUrl',
            ),
            onChanged: setSettings.setApiBaseUrl,
          ),
        ],
      ),
    );
  }
}
