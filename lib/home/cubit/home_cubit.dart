import 'dart:ui' as ui;
import 'package:table_schedule_oblenergo/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:table_schedule_oblenergo/home/network/api.dart';
import 'package:pixel_color_picker/src/services/pixel_color_picker.dart';
import '../../helpers/local_storage.dart';
import '../../utils/array_color.dart';
import 'package:flutter/rendering.dart';
import '../data/table_colors.dart';

/// width 1112 (57), h 244 (63,5)

class HomeCubit extends Cubit<HomeState> {
  bool off = false;
  ColorPicker? _colorPicker;
  List<int> colorTableList = [];
  LocalStorage localStorage = LocalStorage();
  int light = 0, noLight = 0;
  List<TableColors> list = [];
  bool offlineMode = false;

  HomeCubit() : super(const HomeState());

  // localData() async{
  //   var readData = await localStorage.readData();
  //   print(readData.toString());
  // }

  fetchImage(String currentData) async{
    emit(state.copyWith(status: MainStatus.loading));
    var readData = await localStorage.readData();
    if(readData == null || readData == "" && currentData != readData){
      return htmlParse().then((value) {
        emit(state.copyWith(
          status: MainStatus.complete,
          imageUrl: value,
        ));
        localStorage.saveData(currentData);
      }).catchError((Object obj) {
        print('Error: $obj');
      });
    }else{
      offlineMode = true;
      emit(state.copyWith(
        status: MainStatus.complete,
        ///
        //imageUrl: value,
      ));
      return;
    }
    // return htmlParse().then((value) async {
    //   var readData = await localStorage.readUrl();
    //   if(value == readData && value == null || readData == null){
    //     offAlgorithm = true;
    //     emit(state.copyWith(
    //       status: MainStatus.complete,
    //       imageUrl: readData,
    //     ));
    //     return;
    //   }else{
    //     emit(state.copyWith(
    //       status: MainStatus.complete,
    //       imageUrl: value,
    //     ));
    //     localStorage.saveUrl(value);
    //     return;
    //   }
    // }).catchError((Object obj) {
    //   print('Error: $obj');
    // });
  }

  onInteract(Function() _loadSnapshot) async {
    emit(state.copyWith(textStatus: TextStatus.loading));
    if(offlineMode == true){
      emit(state.copyWith(textStatus: TextStatus.complete, willBeLight: light.toString(), willBeNoLight: noLight.toString()));
    }else{
      emit(state.copyWith(textStatus: TextStatus.loading));
      Offset? currentOffset;
      int i1 = 0;
      List<int> allColors = [];
      if (off == true) {
        return;
      } else {
        for (i1; i1 <= CellTable().firstLine.length -1; i1++) {
          var currentColor = CellTable().firstLine[i1];
          var _offset = Offset(currentColor.x!.toDouble(), currentColor.y!.toDouble());
          currentOffset = _offset;
          print(currentOffset);
          if (_colorPicker == null) {
            final _snapshot = await _loadSnapshot();
            final _imageByteData = await _snapshot.toByteData(format: ui.ImageByteFormat.png);
            final _imageBuffer = _imageByteData!.buffer;
            final _uint8List = _imageBuffer.asUint8List();
            _colorPicker = ColorPicker(bytes: _uint8List);
            _snapshot.dispose();
          }
          final _localOffset = currentOffset;
          final _color = await _colorPicker!.getColor(pixelPosition: _localOffset);
          colorTableList.add(_color.value);
          print(_color.value);
          if(i1 >= 23){
            _lightValue(allColors);
            //currentTableColors.colorTableList = colorTableList;
            // if(colorTableList.isNotEmpty){
            //   localStorage.getTableColor(jsonEncode(colorTableList.toString()));
            // }
            return off = true;
          }
        }
      }isClosed;
    }
    return;
  }
  _lightValue(List<int> allColors){
    int i2 = 0;
    for (i2; i2 <= colorTableList.length -1; i2++){
      var arrayColor = colorTableList[i2];
      if(arrayColor == 4294967295){
        light++;
        allColors.add(1);
        print(light);
      }else{
        noLight++;
        allColors.add(0);
        print(noLight);
      }if (i2 >= 23){
        print('close');
        print(allColors.length);
        _lightCalculationInTheTable(allColors);
        emit(state.copyWith(textStatus: TextStatus.complete, willBeLight: light.toString(), willBeNoLight: noLight.toString()));
      }
    }
  }
  _lightCalculationInTheTable(List<int> allColors){
    emit(state.copyWith(listViewStatus: ListViewStatus.loading));
    var startLight;
    var endLight;
    for(var i = 0; i <= allColors.length -1; i++){
      var items = allColors[i];
      if(items == 0 && startLight == null){
        if(i == 0){
          startLight = 24;
        }else{
          startLight = i;
        }
      }else if(items == 1 && startLight != null){
        endLight = i;
        TableColors endLightObj = TableColors(startLight: endLight, endLight: startLight);
        startLight = null;
        endLight = null;
        print('${endLightObj.endLight}:${endLightObj.startLight}');
        ///
        list.add(endLightObj);
        emit(state.copyWith(listViewStatus: ListViewStatus.complete, listColors: list));
        ///
      }if(i == 23 && items == 0 && startLight != null){
        endLight = i +1;
        TableColors endLightObj = TableColors(startLight: endLight, endLight: startLight);
        list.add(endLightObj);
        startLight = null;
        endLight = null;
        print('${endLightObj.endLight}:${endLightObj.startLight}');
        ///
        emit(state.copyWith(listViewStatus: ListViewStatus.complete, listColors: list));
        ///
        localStorage.getListParam(endLightObj);
      }
    }
  }
}