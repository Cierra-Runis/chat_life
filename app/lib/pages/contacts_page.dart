import 'package:chat_life/index.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('联系人'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_rounded),
          ),
        ],
      ),
    );
  }
}
