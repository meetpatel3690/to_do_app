import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../model/todo.dart';
import '../widgets/to_do_items.dart';

class Home extends StatefulWidget {
   Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final todosList=ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState(){
    _foundToDo=todosList;
    super.initState();
  }
  void _runfilter(String value) {
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:50,bottom: 20),
                        child: Text('All ToDos',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      for(ToDo todo in _foundToDo.reversed)
                      ToDoItem(todo:todo,
                      onToDoChanged: _handleToDoChanges,
                        onDeleteItem: _deleteToDoItem,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child:Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                  left: 20,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                    color:tdBGColor,
                    boxShadow: const[BoxShadow(color: Colors.grey,
                    offset: Offset(0.0,0.0),
                    blurRadius: 10.0,
                      spreadRadius: 0.0,
                      ),
                    ],
                  borderRadius: BorderRadius.circular(10),
                ) ,
                  child: TextField(
                    controller: _todoController,
                    decoration: InputDecoration(
                      hintText: 'Add a new todo item',
                      border: InputBorder.none,
                    ),

                  ),
                ),
              ),
              Container(margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text('+',
                    style: TextStyle(
                    fontSize: 40,
                  ),
                  ),
                  onPressed: (){
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: tdBlue,
                    minimumSize: Size(55, 55),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleToDoChanges(ToDo todo){
    setState(() {});
    todo.isDone=!todo.isDone;
  }

  void _deleteToDoItem(String id){
    setState(() {});
    todosList.removeWhere((item) => item.id == id);
  }


  void _addToDoItem(String toDo){
    setState(() {
      todosList.add(ToDo(id: DateTime.now().millisecond.toString(),
          todoText: toDo));
    });
    _todoController.clear();
  void _runfilter(String enteredKeyword){
    List<ToDo> result=[];
    if(enteredKeyword.isEmpty){
      result=todosList;
    }else{
      result=todosList.where((item) => item.todoText!
        .toLowerCase()
        .contains(enteredKeyword.toLowerCase()))
        .toList();
    }
    setState(() {
      _foundToDo=result;
    });
  }

  }
  AppBar _buildAppBar(){
    return  AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color:tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:Image.asset('assets/Images/myprofile3.png')
            ),
          ),
        ],
      ),
    );
  }
}

Widget searchBox(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: TextField(
      //onChanged:(value) => _runFilter(value),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
      ),
    ),
  );
}



