import 'package:chat_life/index.dart';

enum RecordMediaType {
  audio(Icons.mic_rounded),
  video(Icons.center_focus_weak_rounded);

  const RecordMediaType(this.iconData);
  final IconData iconData;
}

class RecordMediaButton extends StatefulWidget {
  const RecordMediaButton({
    super.key,
    required this.onRecord,
  });

  final void Function(String url) onRecord;

  @override
  State<RecordMediaButton> createState() => _RecordMediaButtonState();
}

class _RecordMediaButtonState extends State<RecordMediaButton> {
  bool showRecord = false;
  bool recordLocked = false;
  RecordMediaType recordMediaType = RecordMediaType.audio;
  Future<String?> url = Future.value('');

  void setUrl(Future<String?> url) async {
    if (await url == null) return;
    widget.onRecord((await url)!);
  }

  void closeRecordOrLock(LongPressEndDetails detail) {
    if (!recordLocked) setState(() => showRecord = false);
  }

  void pullUpToLock(LongPressMoveUpdateDetails detail) {
    if (detail.offsetFromOrigin.dy < -120 && !recordLocked) {
      App.vibrate();
      setState(() => recordLocked = true);
    }
  }

  void popUpRecord(LongPressStartDetails details) {
    App.vibrate();
    setState(() => showRecord = true);
  }

  void closeRecord() => setState(() {
        showRecord = false;
        recordLocked = false;
      });

  void switchType() => setState(
        () {
          showRecord = false;
          recordLocked = false;
          recordMediaType = RecordMediaType.values.firstWhere(
            (element) => element != recordMediaType,
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: switchType,
      icon: PortalTarget(
        visible: showRecord,
        portalFollower: RecordAudioView(
          closeRecord: closeRecord,
          setAudioUrl: setUrl,
        ),
        child: GestureDetector(
          onLongPressStart: popUpRecord,
          onLongPressMoveUpdate: pullUpToLock,
          onLongPressEnd: closeRecordOrLock,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(
              key: UniqueKey(),
              recordLocked ? Icons.lock_rounded : recordMediaType.iconData,
            ),
          ),
        ),
      ),
    );
  }
}

class RecordAudioView extends StatefulHookWidget {
  const RecordAudioView({
    super.key,
    required this.closeRecord,
    required this.setAudioUrl,
  });

  final VoidCallback closeRecord;
  final void Function(Future<String?>) setAudioUrl;

  @override
  State<RecordAudioView> createState() => _RecordAudioState();
}

class _RecordAudioState extends State<RecordAudioView> {
  final _controller = RecorderController();

  @override
  void initState() {
    super.initState();
    _controller.updateFrequency = const Duration(milliseconds: 80);
    _controller.record().then((_) => setState(() {}));
  }

  @override
  void dispose() {
    widget.setAudioUrl(_controller.stop());
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.bottomRight * 0.8,
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Badge(
          key: ValueKey(_controller.isRecording),
          backgroundColor:
              _controller.isRecording ? Colors.green : Colors.orange,
          child: Text(_controller.isRecording ? '录制中' : '暂停中'),
        ),
      ),
      content: SizedBox(
        width: double.minPositive,
        child: AudioWaveforms(
          size: const Size(300, 160),
          recorderController: _controller,
          decoration: BoxDecoration(
            color: context.colorScheme.secondaryContainer,
            borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          ),
          waveStyle: WaveStyle(
            waveColor: context.colorScheme.onPrimaryContainer,
            middleLineColor: context.colorScheme.primary,
            scaleFactor: 200,
          ),
        ),
      ),
      actions: [
        StreamBuilder(
          stream: _controller.onCurrentDuration,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data!.toString().split('.').first.padLeft(8, '0'),
              );
            }
            return const Text('00:00:00');
          },
        ),
        IconButton(
          onPressed: () async {
            _controller.isRecording
                ? await _controller.pause()
                : await _controller.record();
            setState(() {});
          },
          icon: Icon(
            key: UniqueKey(),
            _controller.isRecording
                ? Icons.pause_rounded
                : Icons.play_arrow_rounded,
          ),
        ),
        IconButton(
          onPressed: widget.closeRecord,
          icon: const Icon(Icons.check_rounded),
        ),
      ],
    );
  }
}
