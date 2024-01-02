
import 'package:flutter/material.dart';
import 'package:todo_flutter_app/Utils/Colors.dart';

class AppInputs extends StatefulWidget {
  const AppInputs(
      {required this.labelText,
      required this.textInputType,
      required this.textController,
      required this.focusNode,
      this.mMaxline = 1});

  final String labelText;
  final TextInputType textInputType;
  final int mMaxline;
  final TextEditingController textController;
  final FocusNode focusNode;

  @override
  _AppInputsState createState() => _AppInputsState();
}

class _AppInputsState extends State<AppInputs> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
        style: Theme.of(context).textTheme.headlineMedium,
        controller: widget.textController,
        keyboardType: widget.textInputType,
        focusNode: widget.focusNode,
        cursorColor: CommonColors.colorBlack,
        decoration: InputDecoration(
          
          border: const OutlineInputBorder(),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: CommonColors.colorBlack),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: CommonColors.colorBlack!, width: 1.0),
          ),
        ),
        maxLines: widget.mMaxline,
        onFieldSubmitted: (value) {
          // // FocusScope.of(context).requestFocus(passwordFocusNode);
          // Utils.fieldFocusChange(
          //     context, serviceTitleNode, servicePriorityNode);
        });
  }
}
