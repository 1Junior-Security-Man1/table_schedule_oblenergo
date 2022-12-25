import 'dart:ui';

class ArrayColor{
  int width;
  int height;
  Color currentColor;

  ArrayColor ({required this.width, required this.height, required this.currentColor});

  ArrayColor firstLine({int? width, int? height, Color? currentColor}){
    return ArrayColor(
        width: width ?? this.width,
        height: height ?? this.height,
        currentColor: currentColor ?? this.currentColor
    );
  }
}