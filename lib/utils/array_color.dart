import 'dart:ui';

///1 (40)
///2 (53.5)
///3 (65.3)
///4 (80)

class ArrayColor{
  num? x;
  num? y;

  ArrayColor ({this.x, this.y,});

  ArrayColor firstLine({int? width, int? height, Color? currentColor}){
    return ArrayColor(
        x: width ?? this.x,
        y: height ?? this.y,
    );
  }
}

class CellTable{
  num? y;
  List<ArrayColor> firstLine = [
    ArrayColor(x: 59.6, y: 64.5,),
    ArrayColor(x: 75, y: 64.5,),
    ArrayColor(x: 88.7, y: 64.5,),
    ArrayColor(x: 102.5, y: 64.5,),
    ArrayColor(x: 117.5, y: 64.5,),
    ArrayColor(x: 130.2, y: 64.5,),
    ArrayColor(x: 144.0, y: 64.5,),
    ArrayColor(x: 157.8, y: 64.5,),
    ArrayColor(x: 172.4, y: 64.5,),
    ArrayColor(x: 186.2, y: 64.5,),
    ArrayColor(x: 200.5, y: 64.5,),
    ArrayColor(x: 213.5, y: 64.5,),
    ArrayColor(x: 227.6, y: 64.5,),
    ArrayColor(x: 241.4, y: 64.5,),
    ArrayColor(x: 256.5, y: 64.5,),
    ArrayColor(x: 269.8, y: 64.5,),
    ArrayColor(x: 284.5, y: 64.5,),
    ArrayColor(x: 299, y: 64.5,),
    ArrayColor(x: 312, y: 64.5,),
    ArrayColor(x: 326.5, y: 64.5,),
    ArrayColor(x: 340.3, y: 64.5,),
    ArrayColor(x: 353.4, y: 64.5,),
    ArrayColor(x: 368, y: 64.5,),
    ArrayColor(x: 382.5, y: 64.5,),
  ];
}