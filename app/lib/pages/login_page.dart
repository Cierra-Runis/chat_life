import 'package:chat_life/index.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _idOrEmail = TextEditingController();
  final _password = TextEditingController();

  LoginRequestMethod _method = LoginRequestMethod.userId;
  bool _obscure = true;

  void switchLoginMethod(LoginRequestMethod method) =>
      setState(() => _method = method);

  void onPressed(LocalStore setLocalStore) async {
    if (_idOrEmail.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            switch (_method) {
              LoginRequestMethod.userId => '${App.name} ID 不能为空',
              LoginRequestMethod.email => '邮箱不能为空'
            },
          ),
        ),
      );
      return;
    }

    try {
      final res = await Dio(
        BaseOptions(baseUrl: ref.watch(settingsProvider).apiBaseUrl),
      ).post(
        '/api/v1/auth/login',
        data: switch (_method) {
          LoginRequestMethod.userId => LoginRequest.userId(
              userId: _idOrEmail.text,
              password: _password.text,
            ),
          LoginRequestMethod.email => LoginRequest.email(
              email: _idOrEmail.text,
              password: _password.text,
            ),
        }
            .toJson(),
      );

      if (!mounted) return;

      final response = LoginResponse.fromJson(res.data);

      switch (response.result) {
        case LoginResponseResult.emailNotFound:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('邮箱错误')),
          );
          return;
        case LoginResponseResult.passwordError:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('密码错误')),
          );
          return;
        case LoginResponseResult.requestIllegal:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('请求非法')),
          );
          return;
        case LoginResponseResult.userIdNotFound:
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('${App.name} ID 错误')),
          );
          return;
        case LoginResponseResult.success:
          if (response.token != null) {
            setLocalStore.setToken(response.token);
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) => const RootPage(),
              ),
              (route) => false,
            );
          }
      }
    } catch (e, s) {
      App.printLog('$e $s');
    }
  }

  @override
  Widget build(BuildContext context) {
    final setLocalStore = ref.watch(localStoreProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.push(
              const _LoginSettingPage(),
            ),
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: AlertDialog(
        elevation: 2,
        surfaceTintColor: context.colorScheme.background,
        shadowColor: context.colorScheme.shadow,
        icon: SvgPicture.asset(
          /// FIXME: gradient color error
          'assets/images/icon_fill.svg',
          width: 72,
        ),
        title: const Row(children: [Text('登录')]),
        content: SizedBox(
          width: 364 * 0.8,
          child: BasedListView(
            shrinkWrap: true,
            children: [
              Wrap(
                spacing: 8,
                runSpacing: 24,
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TextField(
                    controller: _idOrEmail,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: switch (_method) {
                        LoginRequestMethod.userId => '${App.name} ID',
                        LoginRequestMethod.email => '邮箱'
                      },
                    ),
                  ),
                  TextField(
                    controller: _password,
                    obscureText: _obscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '密码',
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => _obscure = !_obscure),
                        icon: Icon(
                          _obscure
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                        ),
                      ),
                      counter: TextButton(
                        onPressed: () {},
                        child: const Text('找回密码'),
                      ),
                    ),
                  ),
                  const Divider(),
                  _LoginWithOtherMethod(
                    method: _method,
                    switchLoginMethod: switchLoginMethod,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.push(const RegisterPage()),
            child: const Text('创建账号'),
          ),
          FilledButton(
            onPressed: () => onPressed(setLocalStore),
            child: const Text('登录'),
          ),
        ],
        actionsAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}

class _LoginSettingPage extends StatelessWidget {
  const _LoginSettingPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: const LoginSettingSection(),
    );
  }
}

class _LoginWithOtherMethod extends StatelessWidget {
  const _LoginWithOtherMethod({
    required this.method,
    required this.switchLoginMethod,
  });

  final LoginRequestMethod method;
  final void Function(LoginRequestMethod) switchLoginMethod;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 24,
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Text('其他方式登录'),
        if (method != LoginRequestMethod.email)
          IconButton(
            onPressed: () => switchLoginMethod(LoginRequestMethod.email),
            icon: const Icon(Icons.email_rounded),
          ),
        if (method != LoginRequestMethod.userId)
          IconButton(
            onPressed: () => switchLoginMethod(LoginRequestMethod.userId),
            icon: const Icon(Icons.password_rounded),
          ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.phone_rounded),
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.apple_rounded),
        ),
      ],
    );
  }
}
