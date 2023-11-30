import 'package:chat_life/index.dart';

class RegisterPage extends ConsumerStatefulWidget {
  const RegisterPage({super.key});

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final setStore = ref.watch(storeProvider.notifier);

    return Scaffold(
      appBar: AppBar(),
      body: AlertDialog(
        elevation: 2,
        surfaceTintColor: context.colorScheme.background,
        shadowColor: context.colorScheme.shadow,
        icon: SvgPicture.asset(
          /// FIXME: gradient color error
          'assets/images/icon_fill.svg',
          width: 72,
        ),
        title: const Row(children: [Text('注册')]),
        content: const SizedBox(
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
                children: [],
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.push(const LoginPage()),
            child: const Text('已有账号'),
          ),
          FilledButton(
            onPressed: () async {
              try {
                final res = await Dio(
                  BaseOptions(baseUrl: ref.watch(settingsProvider).apiBaseUrl),
                ).post(
                  '/api/v1/auth/register',
                  data: const RegisterRequest(
                    username: 'username',
                    email: 'email',
                    password: 'password',
                  ).toJson(),
                );

                final response = RegisterResponse.fromJson(res.data);

                switch (response.result) {
                  case RegisterResponseResult.emailOccupied:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('邮箱已占用')),
                    );
                    return;
                  case RegisterResponseResult.requestIllegal:
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('请求非法')),
                    );
                    return;
                  case RegisterResponseResult.success:
                    if (response.token != null) {
                      setStore.setToken(response.token);
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
            },
            child: const Text('注册'),
          ),
        ],
        actionsAlignment: MainAxisAlignment.spaceBetween,
      ),
    );
  }
}
