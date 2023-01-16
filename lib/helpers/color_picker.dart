import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import '../home/cubit/home_cubit.dart';

class CurrentPixelColorPicker extends StatefulWidget {
  final Widget child;

  const CurrentPixelColorPicker({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _CurrentPixelColorPickerState createState() => _CurrentPixelColorPickerState();
}

class _CurrentPixelColorPickerState extends State<CurrentPixelColorPicker> {

  late HomeCubit mainCubit;
  final _repaintBoundaryKey = GlobalKey();

  Future<ui.Image> _loadSnapshot() async {
    final RenderRepaintBoundary _repaintBoundary =
    _repaintBoundaryKey.currentContext?.findRenderObject() as RenderRepaintBoundary;
    final _snapshot = await _repaintBoundary.toImage();
    return _snapshot;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      mainCubit = BlocProvider.of<HomeCubit>(context);
      mainCubit.onInteract(_loadSnapshot);
    });
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
}