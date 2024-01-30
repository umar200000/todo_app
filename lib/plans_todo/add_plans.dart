import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddPlansPage extends StatefulWidget {
  final void Function(String planName, DateTime PlanTime) todoDateTime;
  const AddPlansPage(this.todoDateTime, {super.key});

  @override
  State<AddPlansPage> createState() => _AddPlansPageState();
}

class _AddPlansPageState extends State<AddPlansPage> {
  DateTime? _dateTime10;
  TextEditingController textEditingController = TextEditingController();

  void _addDateTime(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((value) {
      setState(() {
        if (value != null) _dateTime10 = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom
                : 150,
          ),
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(labelText: "Title"),
                keyboardType: TextInputType.text,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_dateTime10 == null
                      ? "Plan Day is not chosen..."
                      : DateFormat("EEEE, d MMMM, yyyy").format(_dateTime10!)),
                  TextButton(
                    onPressed: () {
                      _addDateTime(context);
                    },
                    child: Text("Choose Day"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "CANCEL",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (textEditingController.text.isEmpty ||
                          _dateTime10 == null) {
                        return;
                      }
                      widget.todoDateTime(
                          textEditingController.text, _dateTime10!);
                      Navigator.pop(context);
                    },
                    child: Text("Enter"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
