import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _State();
}

class _State extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text("Whatsaap"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Icon(Icons.camera_alt),
                ),
                Tab(
                  child: Text('Chat'),
                ),
                Tab(
                  child: Text('Status'),
                ),
                Tab(
                  child: Text('Call'),
                ),
              ],
            ),
            actions: [
              Icon(Icons.search),
              SizedBox(
                width: 20,
              ),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert_outlined),
                  itemBuilder: (
                    context,
                  ) =>
                      [
                        PopupMenuItem(value: '1 ', child: Text('New Group')),
                        PopupMenuItem(value: '2 ', child: Text('Settings')),
                        PopupMenuItem(value: '3 ', child: Text('Log out')),
                      ])
            ],
          ),



          body: TabBarView(
            children: [
              Text(' Camera'),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1 '),
                      ),
                      title: Text('Hk Awan'),
                      subtitle: Text('Never Give Up '),
                      trailing: Text('12:00 Pm'),
                    );
                  }),
              ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1 '),
                      ),
                      title: Text('John Wick'),
                      subtitle: Text('30 mins ago'),

                    );
                  }),
          ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/1043471/pexels-photo-1043471.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1 '),
                  ),
                  title: Text('John Wick'),
                  subtitle: Text(index %2==0 ? "You missed audio call": 'You missed video call'),
                  trailing: Icon(index %2==0 ? Icons.phone: Icons.video_call),
                );
              }),
            ],
          ),
        ));
  }
}
