import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shop_smart/task.dart';
import 'package:flip_card/flip_card.dart';

class MyListPage extends StatefulWidget {
  @override
  MyListPageState createState() => MyListPageState();
}

class MyListPageState extends State<MyListPage> {

  final List<Task> tasks_clothes = new List();
  final List<Task> tasks_food = new List();

//  bool _foods = false;
  bool _clothes = false;


  @override
  void initState(){
    super.initState();

    setState(() {
      tasks_clothes.add(new Task("Jersey", "R190.00", "Refinay", Colors.deepPurple[600]));
      tasks_clothes.add(new Task("Adidas T-shirt", "R80.00", "Studio 88", Colors.deepPurple[600]));
      tasks_clothes.add(new Task("Adidas Shorts", "R120.00", "Studio 88", Colors.deepPurple[600]));
      tasks_clothes.add(new Task("Relay Flops", "R100.00", "Markham", Colors.deepPurple[600]));
      tasks_clothes.add(new Task("Bras", "R100.00", "Legit", Colors.deepPurple[600]));

      tasks_food.add(new Task("Polony", "R30", "Pick and Pay", Colors.green));
      tasks_food.add(new Task("Braai Pack", "R150", "Pick and Pay", Colors.green));
      tasks_food.add(new Task("Vegies", "R50", "Fruit & Vegiese", Colors.green));
      tasks_food.add(new Task("Ice Cream", "R50", "Shoprite", Colors.green));
      tasks_food.add(new Task("Rice and Things", "R200", "P&P",Colors.green));

    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      FlipCard(
        direction: FlipDirection.VERTICAL, // default

        front: Container(

          width: MediaQuery.of(context).size.width,
          child: ListView.builder(

              itemCount: tasks_clothes.length,
              itemBuilder: (context, position){

//                _foods = false;
                _clothes = true;

                return Dismissible(
                  key: Key(tasks_clothes[position].toString()),

                  background: _myHiddenContainer(
                      tasks_clothes[position].status
                  ),

                  child: _myListContainer(
                      tasks_clothes[position].taskname, tasks_clothes[position].subtask, tasks_clothes[position].tasktime, tasks_clothes[position].status
                  ),
                  onDismissed: (direction){

                    if(direction == DismissDirection.startToEnd){
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Removed",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center
                          )));
                      if(tasks_clothes.contains(tasks_clothes.removeAt(position))){
                        setState(() {
                          tasks_clothes.remove(tasks_clothes.removeAt(position));
                        });
                      }
                    }else{
                      if(direction == DismissDirection.endToStart){
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Item Bought",
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.center))
                        );
                        // Archive functionality
                        if(tasks_clothes.contains(tasks_clothes.removeAt(position))){
                          setState(() {
                            tasks_clothes.remove(tasks_clothes.removeAt(position));
                          });
                        }
                      }
                    }

                  },
                );
              }
          ),
        ),

        back: Container(

          width: MediaQuery.of(context).size.width,

          child: ListView.builder(


              itemCount: tasks_food.length,
              itemBuilder: (context, position){



                return Dismissible(
                  key: Key(tasks_food[position].toString()),

                  background: _myHiddenContainer(
                      tasks_food[position].status
                  ),

                  child: _myListContainer(
                      tasks_food[position].taskname, tasks_food[position].subtask, tasks_food[position].tasktime, tasks_food[position].status
                  ),
                  onDismissed: (direction){

                    if(direction == DismissDirection.startToEnd){
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Removed",
                              style: TextStyle(color: Colors.red),
                              textAlign: TextAlign.center
                          )));
                      if(tasks_food.contains(tasks_food.removeAt(position))){
                        setState(() {
                          tasks_food.remove(tasks_food.removeAt(position));
                        });
                      }
                    }else{
                      if(direction == DismissDirection.endToStart){
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Item Bought",
                                style: TextStyle(color: Colors.green),
                                textAlign: TextAlign.center))
                        );
                        // Archive functionality
                        if(tasks_food.contains(tasks_food.removeAt(position))){
                          setState(() {
                            tasks_food.remove(tasks_food.removeAt(position));
                          });
                        }
                      }
                    }
                  },
                );
              }
          ),
        ),

      ),


      floatingActionButton: new FloatingActionButton(

        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                final taskval = TextEditingController();
                final subval = TextEditingController();
                final tasktime = TextEditingController();

                Color taskcolor;

                return AlertDialog(
                  title: Text("New Item"),
                  content: Container(
                    height: 250.0,
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: TextField(
                            controller: taskval,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Item Name",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          child: TextField(
                            controller: subval,
                            obscureText: false,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Price",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new GestureDetector(
                                onTap: (){
                                  taskcolor = Colors.purple;
                                },
                                child: Container(
                                  width: 25.0,
                                  height: 25.0,
                                  color: Colors.purple,
                                ),
                              ),
                              new GestureDetector(
                                onTap: (){
                                  taskcolor = Colors.amber;
                                },
                                child: Container(
                                  width: 25.0,
                                  height: 25.0,
                                  color: Colors.amber,
                                ),
                              ),
                              new GestureDetector(
                                onTap: (){
                                  taskcolor = Colors.blue;
                                },
                                child: Container(
                                  width: 25.0,
                                  height: 25.0,
                                  color: Colors.blue,
                                ),
                              ),
                              new GestureDetector(
                                onTap: (){
                                  taskcolor = Colors.green;
                                },
                                child: Container(
                                  width: 25.0,
                                  height: 25.0,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: TextField(
                            controller: tasktime,
                            obscureText: false,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Date",
                              hintStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      color: Color(0xff2da9ef),
                      child: Text("Add", style: new TextStyle(
                          color: Colors.white
                      ),),

//                errorText: _validate_eml ? 'Email is required' : null,
                      onPressed: _clothes ? (){
                        setState(() {tasks_clothes.add(new Task(taskval.text, subval.text, tasktime.text, taskcolor));});
                        Navigator.pop(context);
                      }: (){
                        setState(() {tasks_food.add(new Task(taskval.text, subval.text, tasktime.text, taskcolor));});
                        Navigator.pop(context);
                      }
                    ),
                  ],
                );
              }
          );
        },

        tooltip: "Increment",
        child: new Icon(Icons.add , size: 32.0,),
      ),

    );
  }

  Widget _myListContainer(String taskname, String subtask, String taskTime, Color taskColor){

    return Padding(

      padding: const EdgeInsets.all(8.0),

      child: Container(
        height: 70.0,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(7.0)
        ),

        child: Material(
          color: Colors.white,
          elevation: 14.0,
          shadowColor: Color(0x802196F3),
          borderRadius: BorderRadius.circular(9.0),

          child: Container(

            decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(7.0)
            ),

            child: Row(
              children: <Widget>[
                Container(
                  height: 70.0,
                  width: 7.0,
                  color: taskColor,

                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(taskname, style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(subtask, style: TextStyle(
                                fontSize: 18.0, color: Colors.blueAccent)
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(taskTime, style: TextStyle(
                          fontSize: 18.0, color: Colors.black45)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myHiddenContainer(Color taskColor){

    return Container(
      height: MediaQuery.of(context).size.height,
      color: taskColor,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
                icon: Icon(FontAwesomeIcons.solidTrashAlt),
                color: Colors.white,
                onPressed: (){
                  setState(() {

                  });
                }),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
                icon: Icon(FontAwesomeIcons.archive),
                color: Colors.white,
                onPressed: (){
                  setState(() {

                  });
                }),
          ),
        ],
      ),

    );


  }

  void _restitchDress (){

    // Some code Here

  }

}


