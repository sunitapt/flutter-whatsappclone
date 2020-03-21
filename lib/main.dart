import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  void initState() {
    _tabController = new TabController(length: 4, vsync: this);
    _scrollController = new ScrollController();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                actions: <Widget>[
                  Icon(Icons.search),
                  Container(
                    width: 15.0,
                  ),
                  Icon(Icons.more_vert),
                  Container(
                    width: 8.0,
                  ),
                ],
                pinned: true,
                floating: true,
                centerTitle: false,
                backgroundColor: Color(0xFF075e54),
                title: Text('WhatsApp'),
                bottom: TabBar(
                    indicatorWeight: 5.0,
                    indicatorColor: Colors.white,
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Icon(Icons.photo_camera),
                      ),
                      Tab(
                        text: 'CHATS',
                      ),
                      Tab(
                        text: 'STATUS',
                      ),
                      Tab(
                        text: 'CALLS',
                      ),
                    ]),
              )
            ];
          },
          body: TabBarView(
              controller: _tabController,
              children: [Text('CAMERA'), Chats(), Status(), Calls()]),
        ),
      ),
    );
  }
}

class Chats extends StatefulWidget {
  ChatsState createState() => ChatsState();
}

class ChatsState extends State<Chats> {
  List<String> names = [
    'coding club',
    '+91 7517270165',
    'SY IT Official',
    'Panda',
    'Aishuuu',
    'DADA',
    'Nikhil',
    'Shradha',
    'Harsha',
  ];

  List<String> text = [
    'V Nikhil:Complexity will be log(n)',
    'sql.txt',
    'Notice Regarding MSE',
    'shopping shopping',
    'Pics?????',
    'New mobile Cover',
    'doing whatsapp clone in flutter ',
    'Hello.......!',
    'MAkad'
  ];
  List<String> time = [
    '09.00',
    '00.00',
    '23:53',
    'yesterday',
    'yesterday',
    'yesterday',
    '10/01/20',
    '10/01/20',
    '10/01/20',
  ];
  List<String> image = [
    'https://wallpaperaccess.com/full/105234.jpg',
    'https://wallpaperaccess.com/full/105231.jpg',
    'https://wallpaperaccess.com/full/105235.jpg',
    'https://wallpaperaccess.com/full/1050.jpg',
    'https://wallpaperaccess.com/full/105238.jpg',
    'https://wallpaperaccess.com/full/105239.jpg',
    'https://wallpaperaccess.com/full/1150.jpg',
    'https://wallpaperaccess.com/full/1155.jpg',
    'https://wallpaperaccess.com/full/1191.jpg',
  ];
  @override
  // TODO: implement widget
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF25d366),
          child: Center(
            child: Icon(Icons.message),
          ),
          onPressed: null),
      body: Container(
        child: ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(image[index])),
                    title: Text(names[index]),
                    subtitle: Text(text[index]),
                    trailing: Text(time[index]),
                  ),
                  Divider(),
                ],
              );
            }),
      ),
    );
  }
}

class Status extends StatefulWidget {
  StatusState createState() => StatusState();
}

class StatusState extends State<Status> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF25d366),
          child: Icon(Icons.photo_camera),
          onPressed: null),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://wallpaperaccess.com/full/1191.jpg'),
            ),
            title: Text('My Status'),
            subtitle: Text('Tap to Add Status'),
          ),
          Container(
            color: Colors.grey[200],
            width: MediaQuery.of(context).size.width,
            height: 20.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Recent updates',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://wallpaperaccess.com/full/1191.jpg'),
            ),
            title: Text('Sunita'),
            subtitle: Text('15 minutes ago'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://wallpaperaccess.com/full/1191.jpg'),
            ),
            title: Text('bhavya'),
            subtitle: Text('25 minutes ago'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://wallpaperaccess.com/full/1191.jpg'),
            ),
            title: Text('Jiya'),
            subtitle: Text('Today,11:00'),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage('https://wallpaperaccess.com/full/1191.jpg'),
            ),
            title: Text('Baji'),
            subtitle: Text('yesterday,13:00'),
          ),
        ],
      ),
    );
  }
}

class Calls extends StatefulWidget {
  CallsState createState() => CallsState();
}

class CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage('https://wallpaperaccess.com/full/105234.jpg'),
          ),
          title: Text('Baji'),
          subtitle: Row(
            children: <Widget>[
              Icon(
                Icons.arrow_downward,
                color: Colors.red,
              ),
              Text('Today,13:00'),
            ],
          ),
          trailing: Icon(
            Icons.phone,
            color: Color(0xFF075e54),
          ),
        ),
      ],
    );
  }
}
