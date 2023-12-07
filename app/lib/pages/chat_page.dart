import 'package:chat_life/index.dart';

enum SheetType { zero, keyboard, large }

class ChatPage extends StatefulHookWidget {
  const ChatPage({
    super.key,
    required this.id,
  });

  final String id;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  SheetType _sheetType = SheetType.zero;

  void setSheetType(SheetType sheetType) =>
      setState(() => _sheetType = sheetType);

  final textFieldFocusNode = FocusNode();
  final keyboardController = KeyboardVisibilityController();

  @override
  void initState() {
    super.initState();
    keyboardController.onChange.listen((event) {
      App.printLog(event);
      App.printLog(textFieldFocusNode.hasFocus);
      App.printLog(_sheetType);

      if (!event &&
          textFieldFocusNode.hasFocus &&
          _sheetType == SheetType.keyboard) {
        setSheetType(SheetType.zero);
      }
    });
  }

  @override
  void dispose() {
    textFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: AppBar(
        title: Text(widget.id),
      ),
      body: GestureDetector(
        onTap: () {
          textFieldFocusNode.unfocus();
          setSheetType(SheetType.zero);
        },
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: double.maxFinite.toInt(),
            itemBuilder: (context, index) => ListTile(
              title: Text('$index'),
            ),
          ),
        ),
      ),
      bottomSheet: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Input(
            textFieldFocusNode: textFieldFocusNode,
            setSheetType: setSheetType,
            options: InputOptions(
              onTextFieldTap: () {
                textFieldFocusNode.requestFocus();
                setSheetType(SheetType.keyboard);
              },
            ),
            onSendPressed: (message) async {
              setSheetType(SheetType.zero);
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: BasedListView(
                    children: message.data
                        .map(
                          (e) => Text(
                            e.toString(),
                          ),
                        )
                        .toList(),
                  ).adaptAlertDialog,
                ),
              );
              setSheetType(SheetType.keyboard);
            },
          ),
          AnimatedContainer(
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 250),
            height: switch (_sheetType) {
              SheetType.zero => 0,

              /// TODO: Get keyboard height
              SheetType.keyboard => 220,
              SheetType.large => MediaQuery.sizeOf(context).height * 0.5
            },
            child: PageView(
              children: const [
                Center(
                  child: Text('1'),
                ),
                Center(
                  child: Text('2'),
                ),
                Center(
                  child: Text('3'),
                ),
              ],
            ),
          ),
        ],
      ),
      endDrawer: const Drawer(),
    );
  }
}
