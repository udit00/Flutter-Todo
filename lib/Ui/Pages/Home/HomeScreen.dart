import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter_app/Common/CommonColors.dart';
import 'package:todo_flutter_app/Ui/Pages/Home/HomeViewModel.dart';
import 'package:todo_flutter_app/Ui/Pages/Home/models/TodoModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  final HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();    
    viewModel.getTodoList();    
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, value, child) {          
        return Scaffold(
            appBar: AppBar(centerTitle: true, title: Text('Home'), backgroundColor: CommonColors.appBarColor,),
            body: ListView.builder(
              itemCount: viewModel.todoList.length,
              itemBuilder: (context, index) {
                TodoModel model = viewModel.todoList[index];
                Card(
                  child: Text(model.title.toString()),
                );
              },
            ),
          );
        },
      )
    );
  }
}