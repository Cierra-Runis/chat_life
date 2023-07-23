import 'package:chat_life/index.dart';

/// 一个风格化的电池指示器小部件
///
/// 用法示例：
///
/// ```dart
///   Row(
///     children: const [
///       BatteryIndicator(value: 0.75),
///       SizedBox(width: 20),
///       Text('Battery: 75% left'),
///     ],
///   )
/// ```
class IpadBatteryWidget extends StatelessWidget {
  const IpadBatteryWidget({
    super.key,
    required this.batteryStatus,
    this.trackHeight = 12.0,
    this.trackPadding = 1.0,
    this.trackColor,
    this.trackBorderColor,
    this.trackBorderRadius = 3.0,
    this.trackAspectRatio = 2.0,
    this.barColor,
    this.barBorderRadius,
    this.withKnob = true,
    this.icon,
    this.iconOutline,
    this.iconOutlineBlur,
  })  : assert(trackHeight / 2 > trackPadding, '轨道高度不能小于填充的两倍'),
        assert(trackPadding >= 0, '填充必须 >= 0'),
        assert(trackAspectRatio >= 1, '轨道纵横比必须 >= 1');

  /// 显示的值，区间为 [0, 1]
  final BatteryStatus batteryStatus;

  /// The height of the track (i.e. container).
  final double trackHeight;

  /// 指示栏周围的填充，必须 >= 0
  final double trackPadding;

  /// 指示器的背景颜色，不超出边界
  final Color? trackColor;

  /// 轨道边框和电池盖的颜色
  final Color? trackBorderColor;

  /// 轨道边界的圆角半径
  final double trackBorderRadius;

  /// 轨道纵横比必须 >= 1
  final double trackAspectRatio;

  /// The color of the bar within the track. Falls back to [Colors.white] or
  /// [Colors.black] depending on the current [CupertinoThemeData.brightness].
  final Color? barColor;

  /// The border radius of the bar within the track. Should be half of
  /// [trackBorderRadius].
  final BorderRadiusGeometry? barBorderRadius;

  /// Whether to render a knob at the end of the indicator, making it look like
  /// a classic AA battery.
  final bool withKnob;

  /// An optional widget to display in the middle of the battery indicator.
  final Widget? icon;

  /// The color of the [icon] outline. Defaults to [Colors.white].
  final Color? iconOutline;

  /// The size of the outline around [icon]. Defaults to 0.0.
  final double? iconOutlineBlur;

  @override
  Widget build(BuildContext context) {
    final track = _buildTrack(context);

    if (!withKnob) return track;

    final knob = _buildKnob(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        track,
        knob,
      ],
    );
  }

  Widget _buildKnob(BuildContext context) {
    final double knobHeight = trackHeight / 3;
    final double knobWidth = knobHeight / 2;
    final knobRadii = BorderRadius.only(
      topRight: Radius.circular(knobWidth),
      bottomRight: Radius.circular(knobWidth),
    );
    final borderColor = _getCurrentBorderColor(context);

    return Padding(
      padding: EdgeInsets.only(left: trackPadding / 2),
      child: Container(
        width: knobWidth,
        height: knobHeight,
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: knobRadii,
        ),
      ),
    );
  }

  Widget _buildTrack(BuildContext context) {
    final borderRadius = BorderRadius.circular(trackBorderRadius);
    final borderColor = _getCurrentBorderColor(context);
    final width = trackHeight * trackAspectRatio;

    final bar = _buildBar(context, width);

    final children = [bar];

    final icon = this.icon;
    if (icon != null) {
      final outlineColor = iconOutline ?? Colors.white;
      final outlineSize = iconOutlineBlur ?? 0.0;

      children.add(
        Center(
          child: IconTheme(
            data: IconThemeData(
              color: trackColor,
              shadows: <Shadow>[
                Shadow(
                  color: outlineColor,
                  blurRadius: outlineSize,
                  offset: const Offset(1, 1),
                ),
                Shadow(
                  color: outlineColor,
                  blurRadius: outlineSize,
                  offset: const Offset(-1, -1),
                ),
                Shadow(
                  color: outlineColor,
                  blurRadius: outlineSize,
                  offset: const Offset(-1, 1),
                ),
                Shadow(
                  color: outlineColor,
                  blurRadius: outlineSize,
                  offset: const Offset(1, -1),
                )
              ],
            ),
            child: icon,
          ),
        ),
      );
    }

    return Container(
      height: trackHeight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: borderColor),
        color: trackColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(trackPadding),
        child: Stack(children: children),
      ),
    );
  }

  Color _getCurrentBorderColor(BuildContext context) {
    return trackBorderColor ??
        (CupertinoTheme.brightnessOf(context) == Brightness.light
                ? Colors.black
                : Colors.white)
            .withOpacity(0.5);
  }

  Widget _buildBar(BuildContext context, double trackWidth) {
    final width = (trackWidth - trackPadding * 2.0) * batteryStatus.value;
    final borderRadius = barBorderRadius ?? BorderRadius.circular(1.5);
    final currentColor = _getCurrentBarColor(context);

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: currentColor,
      ),
    );
  }

  Color _getCurrentBarColor(BuildContext context) {
    return barColor ??
        (CupertinoTheme.brightnessOf(context) == Brightness.light
            ? Colors.black
            : Colors.white);
  }
}
