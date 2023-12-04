// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tracking_and_tasking/constrains/colors.dart';
import 'package:tracking_and_tasking/models/todomodel.dart';
import 'package:tracking_and_tasking/widgets/todo.dart';

class ManagerScreen extends StatefulWidget {
  const ManagerScreen({super.key});

  @override
  State<ManagerScreen> createState() => _ManagerScreenState();
}

class _ManagerScreenState extends State<ManagerScreen> {
  // ignore: non_constant_identifier_names
  final Todolist = ToDo.todolist();
  List<ToDo> _foundToDo = [];
  final _todocantroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _foundToDo = Todolist;
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
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        child: const Text(
                          "To Do's ",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                          ),
                        ),
                      ),
                      for (ToDo todoo in _foundToDo)
                        TodoItem(
                          todo: todoo,
                          ontodochange: Todohandel,
                          ondelete: Todelete,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 10, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: tdGrey,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(30)),
                  padding: EdgeInsets.only(left: 20),
                  child: TextField(
                    autocorrect: true,
                    controller: _todocantroller,
                    decoration: InputDecoration(
                      hintText: "Add Task Here ",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20, right: 20),
                child: ElevatedButton(
                  onPressed: () {
                    ToAddList(_todocantroller.text);
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: tdvoilet,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                    shape: CircleBorder(),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void Todohandel(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;
    });
  }

  void Todelete(String id) {
    setState(() {
      Todolist.removeWhere((item) => item.id == id);
    });
  }

  void ToAddList(String todotext) {
    if (todotext == "")
      return;
    else {
      setState(() {
        Todolist.add(ToDo(
            id: DateTime.now().microsecondsSinceEpoch.toString(),
            todotext: todotext,
            isDone: false));
      });
      _todocantroller.clear();
    }
  }

  void Search(String enterkeyword) {
    List<ToDo> result = [];
    if (enterkeyword.isEmpty) {
      result = Todolist;
    } else {
      result = Todolist.where((item) =>
              item.todotext!.toLowerCase().contains(enterkeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = result;
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
      automaticallyImplyLeading: false,
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
              child: CachedNetworkImage(
                imageUrl:
                    'https://media.istockphoto.com/id/1297832726/photo/portrait-of-a-smiling-young-businessman.webp?b=1&s=170667a&w=0&k=20&c=-bG-98gM7AR79cs9Fe7UaRGZnENYooOdSkHF5QkZ7xo=',
                placeholder: (context, url) => CircularProgressIndicator(),
                imageBuilder: (context, imageProvider) {
                  return Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover)),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
