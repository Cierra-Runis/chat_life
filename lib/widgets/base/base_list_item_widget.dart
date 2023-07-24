import 'package:chat_life/index.dart';

/// [BaseListItemWidget] 是由 [StatelessWidget] 衍生出的列表系列组件的基类
class BaseListItemWidget extends StatelessWidget {
  const BaseListItemWidget({
    super.key,
    this.padding,
    this.icon,
    this.iconData,
    this.title,
    this.titleText,
    this.titleTextStyle,
    this.summary,
    this.summaryText,
    this.summaryTextStyle,
    this.detailText,
    this.detailTextStyle,
    this.showTitleTextBadge,
    this.showIconBadge,
    this.showDetailTextBadge,
    this.showAccessoryViewBadge,
    this.accessoryView,
    this.bottomView,
    this.disabled = false,
    this.onTap,
    this.width,
    this.minHeight = 56.0,
  });

  final EdgeInsets? padding;
  final Widget? icon;
  final IconData? iconData;
  final Widget? title;
  final String? titleText;
  final TextStyle? titleTextStyle;
  final Widget? summary;
  final String? summaryText;
  final TextStyle? summaryTextStyle;
  final String? detailText;
  final TextStyle? detailTextStyle;
  final Widget? accessoryView;
  final bool? showIconBadge;
  final bool? showTitleTextBadge;
  final bool? showDetailTextBadge;
  final bool? showAccessoryViewBadge;
  final Widget? bottomView;
  final bool disabled;
  final VoidCallback? onTap;
  final double? width;
  final double minHeight;

  void _onTap() {
    if (onTap != null) onTap!();
  }

  Widget buildDetailText(BuildContext context) {
    return Badge(
      showBadge: showDetailTextBadge ?? false,
      child: detailText != null
          ? Text(
              detailText!,
              style: detailTextStyle ??
                  TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.outline,
                  ),
            )
          : Container(),
    );
  }

  Widget buildAccessoryView(BuildContext context) {
    return Badge(
      showBadge: showAccessoryViewBadge ?? false,
      child: accessoryView ??
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Icon(
              Icons.navigate_next,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
            ),
          ),
    );
  }

  Widget buildBottomView(BuildContext context) => bottomView ?? Container();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? null : _onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: width ?? double.infinity,
            constraints: BoxConstraints(
              minHeight: minHeight,
            ),
            padding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
            child: Row(
              children: [
                if (icon != null)
                  Container(
                    margin: const EdgeInsets.fromLTRB(8.0, 0, 24.0, 0),
                    child: Badge(
                      showBadge: showIconBadge ?? false,
                      child: icon,
                    ),
                  )
                else
                  Container(
                    margin: const EdgeInsets.fromLTRB(8.0, 0, 24.0, 0),
                    child: Badge(
                      showBadge: showIconBadge ?? false,
                      child: Icon(
                        iconData,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.38),
                      ),
                    ),
                  ),
                Expanded(
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    alignment: WrapAlignment.center,
                    spacing: 2,
                    children: [
                      if (title != null) title!,
                      if (titleText != null)
                        Badge(
                          showBadge: showTitleTextBadge ?? false,
                          child: Text(
                            titleText ?? '',
                            style:
                                titleTextStyle ?? const TextStyle(fontSize: 16),
                          ),
                        ),
                      if (summary != null) summary!,
                      if (summaryText != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: Text(
                            summaryText ?? '',
                            style: summaryTextStyle ??
                                TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.outline,
                                ),
                          ),
                        ),
                    ],
                  ),
                ),
                buildDetailText(context),
                buildAccessoryView(context),
              ],
            ),
          ),
          buildBottomView(context),
        ],
      ),
    );
  }
}

/// 由 [BaseListItemWidget] 衍生的组件，其右边被替换为开关
class BaseListSwitchItem extends BaseListItemWidget {
  final bool? value;
  final ValueChanged<bool>? onChanged;

  const BaseListSwitchItem({
    required this.value,
    required this.onChanged,
    super.key,
    super.icon,
    super.iconData,
    super.title,
    super.titleText,
    super.titleTextStyle,
    super.summary,
    super.summaryText,
    super.summaryTextStyle,
    super.detailText,
    super.detailTextStyle,
    super.accessoryView,
    super.onTap,
  });

  @override
  void _onTap() => onChanged!(!value!);

  @override
  Widget buildAccessoryView(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: Switch(
        value: value!,
        onChanged: onChanged,
      ),
    );
  }
}

/// 由 [BaseListItemWidget] 衍生的组件，其中部被替换为 [TextField] 输入框
class BaseListTextFieldItem extends BaseListItemWidget {
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onSubmitted;

  const BaseListTextFieldItem({
    super.key,
    super.icon,
    super.iconData,
    super.title,
    super.titleText,
    super.titleTextStyle,
    super.summary,
    super.summaryText,
    super.summaryTextStyle,
    super.accessoryView = const Padding(
      padding: EdgeInsets.only(left: 4),
      child: Icon(null),
    ),
    super.onTap,
    this.hintText,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  });

  @override
  bool get disabled => true;

  @override
  Widget buildDetailText(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(hintText: hintText),
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
      ),
    );
  }
}
