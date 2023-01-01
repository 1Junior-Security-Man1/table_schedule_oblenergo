import 'dart:ui';

class ArrayColor{
  num? x;
  num? y;
  Color? currentColor;

  ArrayColor ({this.x, this.y, this.currentColor});

  ArrayColor firstLine({int? width, int? height, Color? currentColor}){
    return ArrayColor(
        x: width ?? this.x,
        y: height ?? this.y,
        currentColor: currentColor ?? this.currentColor
    );
  }
}

class CellTable{
  List<ArrayColor> firstLine = [
    ArrayColor(x: 59.6, y: 434.2,),
    ArrayColor(x: 75, y: 434.2,),
    ArrayColor(x: 88.7, y: 434.2,),
    ArrayColor(x: 102.5, y: 434.2,),
    ArrayColor(x: 117.5, y: 434.2,),
    ArrayColor(x: 130.2, y: 434.2,),
    ArrayColor(x: 144.0, y: 434.2,),
    ArrayColor(x: 157.8, y: 434.2,),
    ArrayColor(x: 172.4, y: 434.2,),
    ArrayColor(x: 186.2, y: 434.2,),
    ArrayColor(x: 200.5, y: 434.2,),
    ArrayColor(x: 213.5, y: 434.2,),
    ArrayColor(x: 227.6, y: 434.2,),
    ArrayColor(x: 241.4, y: 434.2,),
    ArrayColor(x: 256.5, y: 434.2,),
    ArrayColor(x: 269.8, y: 434.2,),
    ArrayColor(x: 284.5, y: 434.2,),
    ArrayColor(x: 299, y: 434.2,),
    ArrayColor(x: 312, y: 434.2,),
    ArrayColor(x: 326.5, y: 434.2,),
    ArrayColor(x: 340.3, y: 434.2,),
    ArrayColor(x: 353.4, y: 434.2,),
    ArrayColor(x: 368, y: 434.2,),
    ArrayColor(x: 382.5, y: 434.2,),
  ];
}