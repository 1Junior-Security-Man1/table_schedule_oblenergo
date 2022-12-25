import 'package:table_schedule_oblenergo/home/cubit/home_state.dart';
import 'package:bloc/bloc.dart';
import 'package:table_schedule_oblenergo/home/network/api.dart';
import 'package:pixel_color_picker/pixel_color_picker.dart';

import '../../utils/array_color.dart';

/// width 1112, h 244

class HomeCubit extends Cubit<HomeState> {

  HomeCubit() : super(const HomeState());

  fetchImage() {
    emit(state.copyWith(status: MainStatus.loading));
    return htmlParse().then((value) {
      emit(state.copyWith(
        status: MainStatus.complete,
        imageUrl: value,
      ));

      // PixelColorPicker(
      //     child: Image.asset('image.png'),
      //     onChanged: (color) {
      //       setState(() {
      //         this.color = color;
      //       });
      //     }
      // );

      List<ArrayColor> arrayColor = [

      ];

    }).catchError((Object obj) {
      print('Error');
    });
  }
}