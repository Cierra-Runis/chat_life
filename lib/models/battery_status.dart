import 'package:chat_life/index.dart';

class BatteryStatus {
  const BatteryStatus({
    required int value,
    BatteryStatusType type = BatteryStatusType.normal,
  })  : _value = value,
        _type = type;

  final int _value;
  int get value => type != BatteryStatusType.error ? _value : 100;

  final BatteryStatusType _type;
  BatteryStatusType get type {
    if (_type.isError || !_value.isIn(0, 100)) return BatteryStatusType.error;
    return _type;
  }

  Color getBatteryColor(ColorScheme colorScheme) {
    if (type.isError) return Colors.red[900]!;
    if (type.isCharing) return Colors.green[500]!;
    if (type.isLow) return Colors.orange[700]!;
    return _value.isIn(0, 20) ? Colors.red[500]! : colorScheme.onBackground;
  }
}
