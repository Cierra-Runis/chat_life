enum RoomType { group, pm }

enum UserStatusType {
  online,
  offline;

  bool get isOnline => this == online;
  String get label => isOnline ? '在线' : '离线';
}

enum BatteryStatusType { error, low, charging, normal }
