import 'package:flutter/material.dart';
import 'package:mechinetest/controller/user_controller.dart';
import 'package:mechinetest/screens/user_view_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<UserController>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Search here', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: SafeArea(
                child: ListView.builder(
                  itemCount: context.watch<UserController>().users.length,
                  itemBuilder: (context, index) {
                    final user = context.watch<UserController>().users[index];
                    final staredList = context.watch<UserController>().staredList;
                    bool isStared = context.watch<UserController>().isStared(user);
                    return ListTile(
                      title: Text(user.name.toString()),
                      trailing: IconButton(onPressed: () {
                        context.read<UserController>().star(user);
                      }, icon: isStared?Icon(Icons.star,color: Colors.yellow,):Icon(Icons.star_border)),
                      subtitle: Text(user.address!.street.toString()),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserViewScreen(user: user),
                            ));
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
