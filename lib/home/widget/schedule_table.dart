import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import '../cubit/home_state.dart';

class ScheduleTable extends StatefulWidget {
  final HomeState? state;
  const ScheduleTable({Key? key, this.state}) : super(key: key);
  @override
  State<ScheduleTable> createState() => _ScheduleTableState();
}

class _ScheduleTableState extends State<ScheduleTable> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
      width: 400,
      height: 250,
      child: showNetworkImage(),
      ),
    );
  }

  showNetworkImage() {
    if (widget.state?.status == MainStatus.loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return PhotoView(
        backgroundDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        imageProvider: CachedNetworkImageProvider(widget.state!.imageUrl),
      );
    }
  }
}