class ToDo{
  String? id;
  String? todoText;
  bool isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList(){
    return[
      ToDo(id: '01', todoText: 'Morning Pooja',isDone: true),
      ToDo(id: '02', todoText: 'Breakfast',isDone: true),
      ToDo(id: '03', todoText: 'Buy Groceries'),
      ToDo(id: '04', todoText: 'Meeting Attandance'),
      ToDo(id: '05', todoText: 'Check E-mails'),
      ToDo(id: '06', todoText: 'Work on Project for 2 Hours'),

    ];
  }
}