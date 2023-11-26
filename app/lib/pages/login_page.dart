import 'package:chat_life/index.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final setStore = ref.watch(storeProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: SizedBox(
                width: 360,
                child: BasedListSection(
                  titleText: '登录',
                  mainAxisSize: MainAxisSize.min,
                  itemPadding: const EdgeInsets.all(16),
                  children: [
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: '请输入用户名',
                        border: OutlineInputBorder(),
                        labelText: '用户名',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                    TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: '请输入用户名',
                        border: OutlineInputBorder(),
                        labelText: '用户名',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 48),
            child: FilledButton(
              onPressed: () async {
                if (_controller.text != '') {
                  App.printLog(_controller.text);
                  final res =
                      await Dio(BaseOptions(baseUrl: App.apiBaseUrl)).post(
                    '/api/v1/auth/login',
                    data: const LoginRequest.email(
                      email: '2864283875@qq.com',
                      password: 'akljgfwhyg',
                    ).toJson(),
                  );

                  final response = LoginResponse.fromJson(res.data);
                  if (response.token != null) {
                    App.printLog(response.token);
                    setStore.setToken(response.token);
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('用户名不能为空')),
                  );
                }
              },
              child: const Text('登录'),
            ),
          ),
        ],
      ),
    );
  }
}
