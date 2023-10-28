import 'package:flutter/material.dart';
import 'package:mechinetest/models/user_model.dart';
import 'package:mechinetest/utils/extensions.dart';

class UserViewScreen extends StatelessWidget {
  UserModel user;

   UserViewScreen({super.key,required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name!),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(user.id.toString(), textAlign: TextAlign.start),
            Text(user!.name.toString()),
            Text(user.email.toString()),
            Text(user.phone.toString()),
            Text(user.website.toString()),
            SizedBox(
              height: 20,
            ),
            Text(
              'Address',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(
              width: context.w(50),
              child: Wrap(
                children: [
                  Text(user.address!.street.toString()),
                  Text(user!.address!.suite!),
                  Text(user!.address!.city!),
                  Text(user.address!.zipcode.toString()),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Company',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(
              width: context.w(50),
              child: Wrap(
                children: [
                  Text(user.company!.name.toString()),

                  Text(user.company!.catchPhrase.toString()),
                  Text(user.company!.bs.toString()),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
