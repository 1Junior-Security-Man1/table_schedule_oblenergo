import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:photo_view/photo_view.dart';
import '../../utils/array_color.dart';
import '../cubit/home_state.dart';
import 'package:pixel_color_picker/pixel_color_picker.dart';
import 'package:pixel_color_picker/src/services/pixel_color_picker.dart';
import 'dart:ui' as ui;


class ScheduleTable extends StatefulWidget {
  final HomeState? state;
  const ScheduleTable({Key? key, this.state}) : super(key: key);
  @override
  State<ScheduleTable> createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  Color? color;


  test() {

    for (var i = 0; i <= CellTable().firstLine.length; i++) {
      var firstColor = CellTable().firstLine[i];

      var currentOffset;

      setState(() {
        var _offset = Offset(firstColor.x!.toDouble(), firstColor.x!.toDouble());
        currentOffset = _offset;
      });

      // final _color = await _colorPicker!.getColor(pixelPosition: currentOffset);
      //final _color = await _colorPicker!.getColor(pixelPosition: Offset(57.0, 65.0));


      //print(_color);

      return currentOffset;
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      // Center(
      // child: SizedBox(
      // width: 400,
      // height: 250,
      // child:

      Center(
        child: PixelColorPickerTest(
          child: Image.network(widget.state!.imageUrl),
          offset: test(),
          onChanged: (color){
            setState(() {
              this.color = color;
            });
          },
        ),
      );

          // Stack(
          //   children: [
          //     Container(color: this.color ?? Colors.red, height: 35, width: 35,),
          //     PixelColorPickerTest(
          //       child: Image.network(widget.state!.imageUrl),
          //       offset: test(),
          //       onChanged: (color){
          //         setState(() {
          //           this.color = color;
          //         });
          //       },
          //     ),
          //   ],
          // ),
    //   ),
    // );
  }

  // test() async{
  //
  //   for (var i = 0; i <= CellTable().firstLine.length; i++) {
  //     var firstColor = CellTable().firstLine[i];
  //
  //     var currentOffset;
  //
  //     setState(() {
  //       var _offset = Offset(firstColor.width!.toDouble(), firstColor.height!.toDouble());
  //       currentOffset = _offset;
  //     });
  //
  //     // final _color = await _colorPicker!.getColor(pixelPosition: currentOffset);
  //     final _color = await _colorPicker!.getColor(pixelPosition: Offset(57.0, 65.0));
  //
  //
  //     print(_color);
  //   }
  // }

}


class PixelColorPickerTest extends StatefulWidget {
  final Widget child;
  final Offset offset;
  final Function(Color color) onChanged;

  const PixelColorPickerTest({
    Key? key,
    required this.child,
    required this.offset,
    required this.onChanged,
  }) : super(key: key);

  @override
  _PixelColorPickerTestState createState() => _PixelColorPickerTestState();
}

class _PixelColorPickerTestState extends State<PixelColorPickerTest> {
  ColorPicker? _colorPicker;

  final _repaintBoundaryKey = GlobalKey();
  final _interactiveViewerKey = GlobalKey();

  Future<ui.Image> _loadSnapshot() async {
    final RenderRepaintBoundary _repaintBoundary =
    _repaintBoundaryKey.currentContext!.findRenderObject() as RenderRepaintBoundary;

    final _snapshot = await _repaintBoundary.toImage();

    return _snapshot;
  }

  @override
  Widget build(BuildContext context) {

    test() {

      for (var i = 0; i <= CellTable().firstLine.length; i++) {
        var firstColor = CellTable().firstLine[i];

        var currentOffset;

        setState(() {
          var _offset = Offset(firstColor.x!.toDouble(), firstColor.y!.toDouble());
          currentOffset = _offset;
        });

        // final _color = await _colorPicker!.getColor(pixelPosition: currentOffset);
        //final _color = await _colorPicker!.getColor(pixelPosition: Offset(57.0, 65.0));

        //print(_color);

        return currentOffset;
      }
    }

    return Stack(
      children: [
        RepaintBoundary(
          key: _repaintBoundaryKey,
          child:
          //widget.child,

          Stack(
            children: [
              widget.child,
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // _onInteract(test());
                        _onInteract(Offset(59.6, 434.2,));
                      });
                    },
                    child: const Icon(Icons.ac_unit)
                ),
              ),

              // widget.child,
            ],
          ),

          // InteractiveViewer(
          //   key: _interactiveViewerKey,
          //   maxScale: 10,
          //   onInteractionUpdate: (details) {
          //     final _offset = details.focalPoint;
          //     print(_offset);
          //     _onInteract(_offset);
          //   },
          //   child: widget.child,
          // ),

        ),
      ],
    );
  }

  _onInteract(Offset offset) async {
    if (_colorPicker == null) {
      final _snapshot = await _loadSnapshot();

      final _imageByteData =
      await _snapshot.toByteData(format: ui.ImageByteFormat.png);

      final _imageBuffer = _imageByteData!.buffer;

      final _uint8List = _imageBuffer.asUint8List();

      _colorPicker = ColorPicker(bytes: _uint8List);

      _snapshot.dispose();
    }

    final _localOffset = offset;

    final _color = await _colorPicker!.getColor(pixelPosition: _localOffset);

    print(_color);

    widget.onChanged(_color);
  }

  // _findLocalOffset(Offset offset) {
  //   final RenderBox _interactiveViewerBox =
  //   _interactiveViewerKey.currentContext!.findRenderObject() as RenderBox;
  //
  //   final _localOffset = _interactiveViewerBox.globalToLocal(offset);
  //
  //   return _localOffset;
  // }
}