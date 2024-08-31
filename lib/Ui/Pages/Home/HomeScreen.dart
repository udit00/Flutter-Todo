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
  
  HomeViewModel? _homeViewModel;

  @override
  void initState() {
    super.initState();    
    _homeViewModel = Provider.of(context, listen: false);
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      _homeViewModel?.getTodoList("");
    });
    
  }
  
  @override
  Widget build(BuildContext context) {
    if(_homeViewModel == null) {
      return const CircularProgressIndicator();
    } else {
      return SafeArea(
        // child: rawList(_homeViewModel!),
        child: consumerHomeScreen()
      ); 
    }
  }
}

Widget rawList(HomeViewModel viewModel) {
  return Scaffold(
    appBar: AppBar(centerTitle: true, title: Text('Home'), backgroundColor: CommonColors.appBarColor,),
    body: ListView.builder(
      // itemCount: 20,
      // itemBuilder: (context, index) {
      //   return Text('ITEM');
      // },
      itemCount: viewModel.todoList.length,
      itemBuilder: (context, index) {
        TodoModel model = viewModel.todoList[index];
        return Card(
          child: Text(model.title.toString()),
        );
      },

    ),
  );
}

Widget consumerHomeScreen() {
  return Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {      

          return Scaffold(
            appBar: AppBar(centerTitle: true, title: Text('Home'), backgroundColor: CommonColors.appBarColor,),
            body: ListView.builder(
              itemCount: viewModel.todoList.length,
              itemBuilder: (context, index) {
                TodoModel model = viewModel.todoList[index];
                return Card(
                  margin: EdgeInsets.all(5),                  
                  color: CommonColors.unreadChatColor,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(model.title.toString()),
                  ),
                );
              },
            ),
          );
        },
      );
}