import 'package:flutter/material.dart';

import 'InfoScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Clutter",
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Scaffold(
        appBar: AppBar(
          title: Text("Flutter Clutter : OverFlow"),
        ),
        body: getListView(),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.white,
            icon: Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InfoScreen()));
            },
            label: Text("More Info")),
      )),
    );
  }
}

ListView getListView() {
  return ListView(
    children: [
      ListTile(
        leading: Image.asset('images/ui.png'),
        title: Text("Flutter Clutter"),
        subtitle:
            Text("flutter is most powerful.", overflow: TextOverflow.ellipsis),
        onTap: () {
          print("first item clicked");
        },
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/google.png'),
        title: Text("Google News"),
        subtitle: Text(
            "flutter is most famous,flutter is most famous worldwide",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/flutter.png'),
        title: Text("Flutter News"),
        subtitle: Text("flutter runs on space x ships.",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/ui.png'),
        title: Text("Patavinus"),
        subtitle: Text(
            "New version is build through flutter,flutter is most famous worldwide",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/airplane.png'),
        title: Text("Google News"),
        subtitle: Text(
            "flutter is most famous worldwide flutter is most famous framework. flutter now rums on space x ships New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/news.png'),
        title: Text("Flutter News"),
        subtitle: Text(
            "flutter now rums on space x ships flutter is most famous framework. flutter now rums on space x ships New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/chat.png'),
        title: Text("Patavinus"),
        subtitle:
            Text("Flutter version is build.", overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/flutter.png'),
        title: Text("Google News"),
        subtitle: Text(
            "flutter is most famous,New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/google.png'),
        title: Text("Flutter News"),
        subtitle: Text(
            "flutter now rums on space x ships,New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/ui.png'),
        title: Text("Patavinus"),
        subtitle: Text("New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/chat.png'),
        title: Text("Google News"),
        subtitle: Text(
            "flutter is most famous,New version is build through flutterNew version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/news.png'),
        title: Text("Flutter News"),
        subtitle: Text("flutter now rums on space x ships",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/google.png'),
        title: Text("Patavinus"),
        subtitle: Text(
            "New version is build through flutter, flutter is most famous",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/flutter.png'),
        title: Text("Google News"),
        subtitle: Text(
            "flutter is most famous framework. flutter now rums on space x ships New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/ui.png'),
        title: Text("Flutter News"),
        subtitle: Text(
            "flutter now rums on space x ships New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
      ListTile(
        leading: Image.asset('images/chat.png'),
        title: Text("Patavinus"),
        subtitle: Text("New version is build through flutter",
            overflow: TextOverflow.ellipsis),
        trailing: Text("just now"),
      ),
    ],
  );
}
