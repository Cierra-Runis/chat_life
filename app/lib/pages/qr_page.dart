import 'package:chat_life/index.dart';

class QRPage extends StatelessWidget {
  const QRPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的二维码'),
      ),
      body: Center(
        child: SizedBox.square(
          dimension: 200,
          child: BasedQr(
            qrImage: QrImage(
              QrCode.fromData(
                data: 'data',
                errorCorrectLevel: QrErrorCorrectLevel.L,
              ),
            ),
            colors: const [
              Color(0XFF52FAAF),
              Color(0xFFEF8C13),
              Color(0XFF586EE6),
              Color(0xFFFF5EAC),
            ],
            options: BasedQrOptions(frequency: 20),
          ),
        ),
      ),
    );
  }
}
