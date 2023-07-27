import 'package:chat_life/index.dart';

class IpadStatus {
  const IpadStatus({
    required this.dateTime,
    required this.batteryStatus,
  });

  final DateTime dateTime;
  final BasedBatteryStatus batteryStatus;
}
