import 'package:flutter/material.dart';
import 'package:ztabbar/ztabbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController tabController;
  List tabs = ["你好",'我是四个字'];
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          ExtendedTabBar(
              isScrollable: tabs.length > 4,
              height: 50,
              labelColor: Colors.black,
              backgroundColor: Colors.yellow,
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              controller: tabController,
              tabs: tabs.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: ExtendedTabBarView(
                controller: tabController,
                children: tabs
                    .map((e) => Center(
                          child: Text(e),
                        ))
                    .toList()),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tabs.add("测四二合一");
            tabController.dispose();
            tabController = TabController(length: tabs.length, vsync: this);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
