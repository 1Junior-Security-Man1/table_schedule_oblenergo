import 'package:flutter/material.dart';
import 'helpers/local_notification.dart';
import 'helpers/local_storage.dart';
import 'home/cubit/home_cubit.dart';
import 'home/home_page.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{

  LocalStorage localStorage = LocalStorage();

  WidgetsFlutterBinding.ensureInitialized();

  NotificationService().initializePlatformNotifications();

  tz.initializeTimeZones();

  var currentData = '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}';
  //localStorage.saveData(currentData);

  runApp(BlocProvider(create: (context) => HomeCubit(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Table Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      //home: const HomePage1(),
    );
  }
}