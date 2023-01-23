import 'package:flutter/material.dart';
import 'package:table_schedule_oblenergo/helpers/color_picker.dart';
import 'package:table_schedule_oblenergo/home/widget/popup.dart';
import 'package:table_schedule_oblenergo/utils/colors.dart';
import '../cubit/home_state.dart';

class ScheduleTable extends StatefulWidget {
  final HomeState? state;

  ScheduleTable({Key? key, this.state}) : super(key: key);

  @override
  State<ScheduleTable> createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {

  showTableParams() {
    if (widget.state!.textStatus == TextStatus.initial) {
      return const CircularProgressIndicator();
    } else if (widget.state!.textStatus == TextStatus.loading) {
      return const CircularProgressIndicator();
    } else {
      return Text(
          'There will be light: ${widget.state!.willBeLight},'
          ' There will be no light: ${widget.state!.willBeNoLight}',
          style: const TextStyle(fontSize: 16, color: Colors.white));
    }
  }

  showListView() {
    if (widget.state!.listViewStatus == ListViewStatus.initial) {
      return const CircularProgressIndicator();
    } else if (widget.state!.listViewStatus == ListViewStatus.loading) {
      return const CircularProgressIndicator();
    } else {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Container(
              height: 280,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: widget.state!.listColors.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: AppColors.backgroundColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 55,
                          width: 155,
                          color: Colors.grey[700],
                          child: Center(
                              child: Text(
                                  "${widget.state!.listColors[index].endLight.toString()} - ${widget.state!.listColors[index].startLight.toString()}",
                                  style: const TextStyle(color: Colors.white, fontSize: 25))),
                        ),
                        Container(
                          height: 55,
                          width: 155,
                          color: Colors.grey[700],
                          child: popupMenu(context),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }


  // Future.delayed(const Duration(seconds: 1), () {
  // mainCubit = BlocProvider.of<HomeCubit>(context);
  // mainCubit.onInteract(_loadSnapshot);
  // });

  @override
  Widget build(BuildContext context) {
    if (widget.state!.status == MainStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return
        Padding(
        padding: const EdgeInsets.only(top: 255.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            showTableParams(),
            CurrentPixelColorPicker(
              child: Image.network(widget.state!.imageUrl,
                // loadingBuilder: (context, child, loadingProgress) {
                // if (loadingProgress == null) return child;
                // return const Center(child: Text('Loading...', style: TextStyle(color: Colors.white),));
                //},
              ),
              //child: Image.asset('assets/gr_251222.png'),
            ),
            showListView(),
          ],
        ),
      );
    }
  }
}