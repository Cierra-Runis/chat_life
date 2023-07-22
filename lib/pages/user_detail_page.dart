import 'package:chat_life/index.dart';

class UserDetailPage extends StatelessWidget {
  const UserDetailPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: BackButton(
              onPressed: () => Navigator.popUntil(
                context,
                (route) => route.isFirst,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                user.cover,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const ChatLifeLogoWidget(),
              ),
            ),
            expandedHeight: MediaQuery.of(context).size.height * 2 / 5,
            stretch: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings_rounded),
                onPressed: () {},
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BaseListItemWidget(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BaseAvatarWidget(
                          icon: user.icon,
                          size: 72,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(fontSize: 18),
                          ),
                          Text('ChatLife: ${user.id}')
                        ],
                      )
                    ],
                  ),
                  accessoryView: IconButton(
                    icon: Column(
                      children: [
                        const Icon(Icons.thumb_up_outlined),
                        Text('${user.likes}'),
                      ],
                    ),
                    onPressed: () {}, // TODO:
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
