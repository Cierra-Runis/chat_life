import 'package:server/index.dart';

Handler middleware(Handler handler) =>
    handler.use(provider((context) => IsarService()));
