import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _activeMenu = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Main Page'),
            Text(
              'Welcome',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Add',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 15,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: const [
                  AppBox(title: 'C1'),
                  SizedBox(width: 15),
                  AppBox(title: 'C2'),
                  SizedBox(width: 15),
                  AppBox(title: 'C3'),
                ],
              ),
              const SizedBox(height: 100),
              ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.zero,
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    isExpanded ? _activeMenu = -1 : _activeMenu = index;
                  });
                },
                children: List.generate(20, (index) {
                  var number = index + 1;
                  return ExpansionPanel(
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return ListTile(
                        title: Text('Menu $number'),
                      );
                    },
                    body: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Information'),
                              ElevatedButton(
                                onPressed: () {
                                  print('Menu $number');
                                },
                                child: const Text('Ok'),
                              )
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text('Name $number'),
                          Text('Address $number'),
                        ],
                      ),
                    ),
                    isExpanded: index == _activeMenu,
                  );
                }),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AppBox extends StatelessWidget {
  final String? title;

  const AppBox({
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1 / 1.25,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Center(
            child: Text(title ?? '-'),
          ),
        ),
      ),
    );
  }
}
