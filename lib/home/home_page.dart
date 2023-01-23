import 'package:flutter/material.dart';
import 'package:table_schedule_oblenergo/helpers/local_storage.dart';
import 'package:table_schedule_oblenergo/home/data/table_colors.dart';
import 'package:table_schedule_oblenergo/home/widget/schedule_table.dart';
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
  final _repaintBoundaryKey = GlobalKey();
  TableColors tableColors = TableColors();
  late HomeCubit mainCubit;
  LocalStorage localStorage = LocalStorage();

  @override
  void initState() {
    var currentData = '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
    htmlParse();
    mainCubit = BlocProvider.of<HomeCubit>(context);
    mainCubit.fetchImage(currentData);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var current = DateTime.now();
    return Scaffold(
      key: _repaintBoundaryKey,
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