import 'package:flutter/material.dart';
import 'package:table_schedule_oblenergo/home/widget/schedule_table.dart';
import 'package:table_schedule_oblenergo/utils/alert_dialog.dart';
import '../utils/colors.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_state.dart';
import 'network/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeCubit mainCubit;

  @override
  void initState() {
    htmlParse();
    mainCubit = BlocProvider.of<HomeCubit>(context);
    mainCubit.fetchImage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var current = DateTime.now();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, size: 44),
        onPressed: () =>
            Navigator.of(context).push(PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) => alertDialog(context))),
      ),
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        flexibleSpace: Container(
          color: AppColors.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Oblenergo Table',
                    style: TextStyle(color: Colors.white, fontSize: 16)),
                Text('${current.day}.${current.month}.${current.year}',
                    style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
        return ScheduleTable(state: state);
      }),
    );
  }
}