// import 'package:chat_life/index.dart';
// import 'package:flutter/foundation.dart';

// mixin ChatThemeMixin on Diagnosticable {
//   DefaultChatTheme getChatTheme(BuildContext context) {
//     final colorScheme = context.colorScheme;

//     const bodyTextStyle = TextStyle(
//       fontSize: 14,
//       height: 1.5,
//     );

//     final linkDescriptionTextStyle = TextStyle(
//       fontSize: 12,
//       color: colorScheme.onBackground,
//     );
//     final linkTitleTextStyle = TextStyle(
//       fontSize: 16,
//       color: colorScheme.primary,
//       fontWeight: FontWeight.bold,
//     );
//     final bodyLinkTextStyle = TextStyle(
//       color: colorScheme.primary,
//       decorationColor: colorScheme.primary,
//       decoration: TextDecoration.underline,
//     );

//     const userTextStyle = TextStyle(fontSize: 12, height: 4 / 3);

//     return DefaultChatTheme(
//       /// colors
//       errorColor: colorScheme.error,
//       highlightMessageColor: colorScheme.background,
//       primaryColor: context.brightness.isDark
//           ? const Color(0x2E000000)
//           : const Color(0xFFF2F2F2),
//       secondaryColor: context.brightness.isDark
//           ? const Color(0x2E000000)
//           : const Color(0xFFF2F2F2),
//       backgroundColor: colorScheme.background,

//       /// input layout
//       inputElevation: 3,
//       inputSurfaceTintColor: colorScheme.surfaceTint,
//       inputBackgroundColor: colorScheme.background,
//       inputTextColor: colorScheme.onBackground,
//       inputTextStyle: bodyTextStyle,
//       inputBorderRadius: BorderRadius.zero,
//       inputContainerDecoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(
//             color: colorScheme.outlineVariant,
//             width: 0.5,
//           ),
//         ),
//       ),

//       /// message layout
//       messageBorderRadius: 12,
//       messageInsetsHorizontal: 12,
//       messageInsetsVertical: 6,

//       /// user textStyle
//       userNameTextStyle: userTextStyle,
//       userAvatarTextStyle: userTextStyle,

//       /// sent message textStyle
//       sentMessageBodyTextStyle: bodyTextStyle,
//       sentMessageBodyLinkTextStyle: bodyLinkTextStyle,
//       sentMessageLinkTitleTextStyle: linkTitleTextStyle,
//       sentMessageLinkDescriptionTextStyle: linkDescriptionTextStyle,

//       /// received message textStyle
//       receivedMessageBodyTextStyle: bodyTextStyle,
//       receivedMessageBodyLinkTextStyle: bodyLinkTextStyle,
//       receivedMessageLinkTitleTextStyle: linkTitleTextStyle,
//       receivedMessageLinkDescriptionTextStyle: linkDescriptionTextStyle,
//     );
//   }
// }
