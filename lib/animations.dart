
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveCheckmarkAnimation extends StatefulWidget {
  @override
  _RiveCheckmarkAnimationState createState() => _RiveCheckmarkAnimationState();
}

class _RiveCheckmarkAnimationState extends State<RiveCheckmarkAnimation> {
  late Artboard _artboard;

  @override
  void initState() {
    super.initState();
    loadRiveFile();
  }

  Future<void> loadRiveFile() async {
    final ByteData data = await rootBundle.load('assets/check.riv');
    final RiveFile file = RiveFile.import(data);
    final Artboard artboard = file.mainArtboard;
    setState(() {
      _artboard = artboard;
      _artboard.addController(SimpleAnimation('animation_name'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_artboard != null) {
          _artboard.addController(SimpleAnimation(''));
        }
      },
      child: Container(
        width: 100,
        height: 100,
        child: _artboard != null
            ? Rive(
                artboard: _artboard,
                fit: BoxFit.contain,
              )
            : CircularProgressIndicator(), // Show loading indicator while loading the Rive file
      ),
    );
  }
}
