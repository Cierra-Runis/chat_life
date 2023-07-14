import 'package:chat_life/common/chat_life_user.dart';
import 'package:chat_life/index.dart';

class SaveViewWidget extends StatelessWidget {
  const SaveViewWidget({
    super.key,
    required this.dateTime,
  });

  final DateTime dateTime;

  Widget _getGridBySnapshotData(
    BuildContext context,
    AsyncSnapshot<List<Save>> snapshot,
  ) {
    List<Save> saves = snapshot.data!;

    return Center(
      child: FolderWidget(
        itemCount: saves.length < 16 ? saves.length + 1 : 16,
        itemBuilder: (context, index) {
          if (index == saves.length) {
            return Center(
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.background.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: InkWell(
                  onTap: () => isarService.saveSave(
                    Save(
                      id: Isar.autoIncrement,
                      createDateTime: DateTime.now(),
                      latestEditTime: DateTime.now(),
                      messagesJsonString: '[]',
                      currentUserJsonString: jsonEncode(
                        ChatLifeUser.mercury.toJson(),
                      ),
                    ),
                  ),
                  onLongPress: isarService.cleanDb,
                  child: const Icon(Icons.add),
                ),
              ),
            );
          }
          return ChatLifeSaveWidget(
            save: saves[index],
            name: '${saves[index].id}',
            dateTime: dateTime,
            deleteMode: false,
          );
        },
      ),
    );
  }

  Widget _getBodyBySnapshotState(
    BuildContext context,
    AsyncSnapshot<List<Save>> snapshot,
  ) {
    if (snapshot.hasError) {
      return Center(child: Text('Steam error: ${snapshot.error}'));
    }
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        return const Center(child: Icon(UniconsLine.data_sharing));
      case ConnectionState.waiting:
        return const ChatLifeLoadingWidget();
      case ConnectionState.active:
        return _getGridBySnapshotData(context, snapshot);
      case ConnectionState.done:
        return const Center(child: Text('Stream closed'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return FolderViewWidget(
      folderName: '存档',
      streamBuilder: StreamBuilder<List<Save>>(
        stream: isarService.listenToSaves(),
        builder: _getBodyBySnapshotState,
      ),
    );
  }
}
