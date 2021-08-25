import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text("Maix Xbox"),
      ),
      body: GestureDetector(
        child: Container(height: 200, width: 200, color: Colors.red),
        onTap: () {
          // final INavigation _navigation = GetIt.instance.get<INavigation>();
          // _navigation.navigateTo(NavigationRoutes.home2);
        },
      ),
    );
  }
}
