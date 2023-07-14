import 'package:chat_life/index.dart';

class ChatLifeLoadingWidget extends StatelessWidget {
  const ChatLifeLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.beat(
            color: Colors.orange,
            size: 48,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '加载中',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
