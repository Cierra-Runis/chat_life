import 'package:chat_life/index.dart';

class BaseFadeShimmerWidget extends StatefulWidget {
  const BaseFadeShimmerWidget({
    super.key,
    this.millisecondsDelay = 0,
    this.radius = 0,
    this.child,
    this.childAlignment = Alignment.center,
    required this.width,
    required this.height,
  });

  final double radius;
  final double width;
  final double height;
  final Widget? child;
  final AlignmentGeometry? childAlignment;

  /// 在更新颜色之前延迟时间，使用它来使加载项目动画跟随彼此而不是平行
  final int millisecondsDelay;

  /// 用它来创建一个圆形加载小部件
  const BaseFadeShimmerWidget.round({
    super.key,
    required double size,
    this.millisecondsDelay = 0,
    this.child,
    this.childAlignment,
  })  : height = size,
        width = size,
        radius = size / 2;

  @override
  State<BaseFadeShimmerWidget> createState() => _BaseFadeShimmerWidgetState();
}

class _BaseFadeShimmerWidgetState extends State<BaseFadeShimmerWidget> {
  static final isHighLightStream = Stream<bool>.periodic(
    const Duration(seconds: 1),
    (x) => x % 2 == 0,
  ).asBroadcastStream();

  bool _isHighLight = true;
  late StreamSubscription sub;

  @override
  void initState() {
    super.initState();
    sub = isHighLightStream.listen(
      (isHighLight) {
        if (widget.millisecondsDelay != 0) {
          Future.delayed(
            Duration(milliseconds: widget.millisecondsDelay),
            () => _isHighLight = isHighLight,
          );
        } else {
          _isHighLight = isHighLight;
        }
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 800),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _isHighLight
            ? colorScheme.outline.withOpacity(0.4)
            : colorScheme.outline.withOpacity(0.1),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      alignment: widget.childAlignment,
      child: widget.child,
    );
  }
}