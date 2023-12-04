import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tracking_and_tasking/constrains/colors.dart';
import 'package:tracking_and_tasking/screens/ManagerScreen.dart';

import '../models/ToEmployee.dart';

class Toemp extends StatelessWidget {
  final ToEmployee toEmployee;

  const Toemp({super.key, required this.toEmployee});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ManagerScreen()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        tileColor: Colors.white,
          leading: CachedNetworkImage(
          imageUrl: toEmployee.image.toString(),
          placeholder: (context, url) => const CircularProgressIndicator(),
          imageBuilder: (context, imageProvider) {
            return Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            );
          },
        ),
        title: Text(
          toEmployee.empname!,
          style: TextStyle(
            fontSize: 25,
            fontWeight:FontWeight.w300,
            color: tdBlack,
          ),
        ),
      ),
    );
  }
}
