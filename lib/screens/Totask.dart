import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tracking_and_tasking/widgets/ToEmp.dart';
import '../constrains/colors.dart';
import '../models/ToEmployee.dart';

class Totask extends StatefulWidget {
  Totask({super.key});

  @override
  State<Totask> createState() => _TotaskState();
}

class _TotaskState extends State<Totask> {
  final tasklist = ToEmployee.toemplist();
  List<ToEmployee> _list = [];
  @override
  void initState() {
    // TODO: implement initState
    _list = tasklist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: _buildAppbar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            child: Column(
              children: [
                SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        child: Text(
                          'Employees',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                      ),
                      for (ToEmployee tomep in _list) Toemp(toEmployee: tomep),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    void Search(String enterkeyword) {
    List<ToEmployee> result = [];
    if (enterkeyword.isEmpty) {
      result = tasklist;
    } else {
      result = tasklist.where((item) =>
              item.empname!.toLowerCase().contains(enterkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _list = result;
    });
  }


  Widget SearchBox() {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value) => Search(value),
        autocorrect: true,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, maxWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }


  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: tdBgColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: Colors.black,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl:
                    'https://media.istockphoto.com/id/1297832726/photo/portrait-of-a-smiling-young-businessman.webp?b=1&s=170667a&w=0&k=20&c=-bG-98gM7AR79cs9Fe7UaRGZnENYooOdSkHF5QkZ7xo=',
                placeholder: (context, url) => CircularProgressIndicator(),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

