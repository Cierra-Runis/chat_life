import 'package:chat_life/index.dart';

class BatteryStatus {
  const BatteryStatus({
    required this.value,
    required BatteryStatusType type,
  }) : _type = type;

  final int value;
  final BatteryStatusType _type;
  BatteryStatusType get type =>
      value >= 0 && value <= 20 ? _type : BatteryStatusType.low;
}
