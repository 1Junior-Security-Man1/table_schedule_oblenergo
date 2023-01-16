import 'package:flutter/material.dart';

enum Menu {
  none,
  fiveMinutes,
  hour,
}
                                  ///state
Widget popupMenu(BuildContext context) {
  var currentIndex;
  return PopupMenuButton<Menu>(
    initialValue: currentIndex ?? Menu.none,
    icon: const Icon(Icons.settings),
    color: Colors.grey[600],
    itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
      PopupMenuItem<Menu>(
        onTap: () async{
          var status = "none";
          currentIndex = Menu.none;
          //setOrderStatus(status, context, state);
        },
        value: Menu.none,
        child: const Text('None', style: TextStyle(color: Colors.white)),
      ),
      PopupMenuItem<Menu>(
        onTap: () async{
          var status = "fiveMinutes";
          currentIndex = Menu.fiveMinutes;
          //setOrderStatus(status, context, state);
        },
        value: Menu.fiveMinutes,
        child: const Text('5 min', style: TextStyle(color: Colors.white)),
      ),
      PopupMenuItem<Menu>(
        onTap: () async{
          var status = "hour";
          currentIndex = Menu.hour;
          //setOrderStatus(status, context, state);
        },
        value: Menu.hour,
        child: const Text('1 hour', style: TextStyle(color: Colors.white)),
      ),
    ],
  );
}

// void setOrderStatus(String status, BuildContext context, OrderState state){
//   BlocProvider.of<OrderCubit>(context).setCurrentStatus(status);
// }