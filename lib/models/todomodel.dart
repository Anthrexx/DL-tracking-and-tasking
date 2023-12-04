class ToDo {
  String? id;
  String? todotext;
  late bool isDone;

  ToDo({
    required this.id,
    required this.isDone,
    required this.todotext,
  });
  static List<ToDo> todolist() {
    return [
      ToDo(id: '1', isDone: false , todotext: 'Dharamshala civil lines house no 14 '),
      ToDo(id: '2', isDone: false , todotext: 'kangra near dunga bazzar '),
      ToDo(id: '3', isDone: false , todotext: 'kotwali bazzar'),
      ToDo(id: '4', isDone: false , todotext: 'dari near mela ground'),
      // ToDo(id: '5', isDone: false, todotext: 'Dharamshala civil lines house no 14 '),
      // ToDo(id: '6', isDone: false , todotext: 'Dharamshala civil lines house no 14 '),
      // ToDo(id: '7', isDone: false , todotext: 'Dharamshala civil lines house no 14 '),
      // ToDo(id: '8', isDone: false , todotext: 'Dharamshala civil lines house no 14 '),
    ];
  }
}
