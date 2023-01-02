import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../../utils/array_color.dart';
import '../cubit/home_state.dart';
import 'package:pixel_color_picker/src/services/pixel_color_picker.dart';
import 'dart:ui' as ui;

class ScheduleTable extends StatefulWidget {
  final HomeState? state;

  ScheduleTable({Key? key, this.state}) : super(key: key);

  @override
  State<ScheduleTable> createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  Color? color;

  List<Color> listColor = [];

  // var currentOffset;
  //
  // test() {
  //   for (var i = 0; i < CellTable().firstLine.length; i++) {
  //     var firstColor = CellTable().firstLine[i];
  //     setState(() {
  //       var offset = Offset(firstColor.x!.toDouble(), firstColor.x!.toDouble());
  //       currentOffset = offset;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //test();
    if (widget.state?.status == MainStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: PixelColorPickerTest(
          onChanged: (color) {
            setState(() {
              this.color = color;
              listColor.add(color);
              print(color);
            });
          },
          // child: Image.network(widget.state!.imageUrl, loadingBuilder: (context, child, loadingProgress) {
          //   if (loadingProgress == null) return child;
          //   return const Center(child: Text('Loading...'));
          //   },
          // ),
          child: Image.asset('assets/gr_251222.png'),
        ),
      );
    }
  }
}

class PixelColorPickerTest extends StatefulWidget {
  final Widget child;
  final Function(Color color) onChanged;

  PixelColorPickerTest({
    Key? key,
    required this.child,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PixelColorPickerTestState createState() => _PixelColorPickerTestState();
}

class _PixelColorPickerTestState extends State<PixelColorPickerTest> {
  ColorPicker? _colorPicker;

  final _repaintBoundaryKey = GlobalKey();

  Future<ui.Image> _loadSnapshot() async {
    final RenderRepaintBoundary _repaintBoundary =
    _repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary;

    final _snapshot = await _repaintBoundary.toImage();

    return _snapshot;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      _onInteract();
    });
    //_onInteract();
    return Stack(
      children: [
        RepaintBoundary(
          key: _repaintBoundaryKey,
          child: Stack(
            children: [
              widget.child,
            ],
          ),
        ),
      ],
    );
  }

  _onInteract() async {
    Offset? currentOffset;
    int i1 = 0;
    // if (i1 == CellTable().firstLine.length) {
    if (i1 == 23) {
      return;
    } else {
      for (var i = 0; i < CellTable().firstLine.length; i++) {
        i1 = i;
        var firstColor = CellTable().firstLine[i];

        setState(() {
          var _offset = Offset(firstColor.x!.toDouble(), firstColor.y!.toDouble());
          currentOffset = _offset;
        });

        print(currentOffset);

        if (_colorPicker == null) {
          final _snapshot = await _loadSnapshot();

          final _imageByteData = await _snapshot.toByteData(format: ui.ImageByteFormat.png);

          final _imageBuffer = _imageByteData!.buffer;

          final _uint8List = _imageBuffer.asUint8List();

          _colorPicker = ColorPicker(bytes: _uint8List);

          _snapshot.dispose();
        }
        final _localOffset = currentOffset!;

        final _color = await _colorPicker!.getColor(pixelPosition: _localOffset);

        //print(_color);

        widget.onChanged(_color);
      }
    }
    return;
  }
}