import 'package:chat_life/index.dart';

class IpadWidget extends StatelessWidget {
  const IpadWidget({
    super.key,
    required this.save,
    required this.dateTime,
  });

  final Save save;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: IpadStatusBarWidget(
        ipadStatus: IpadStatus(
          dateTime: dateTime,
          batteryStatus: const BatteryStatus(
            value: 100,
            type: BatteryStatusType.normal,
          ),
        ),
      ),
      body: Stack(
        children: [
          ChatLifeAppWidget(save: save, dateTime: dateTime),
          const IpadDockBarWidget()
        ],
      ),
    );
  }
}
