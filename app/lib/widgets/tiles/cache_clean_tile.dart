import 'package:chat_life/index.dart';

class CacheCleanTile extends StatelessWidget {
  const CacheCleanTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasedListTile(
      leadingIcon: Icons.cleaning_services_rounded,
      titleText: '应用缓存清理',
      onTap: () {},
      trailing: FutureBuilder(
        future: getApplicationCacheDirectory(),
        builder: (context, snapshot) {
          App.printLog(snapshot.data);
          return Text(Bytes.format(bytes: snapshot.data?.getBytes() ?? 0));
        },
      ),
    );
  }
}
