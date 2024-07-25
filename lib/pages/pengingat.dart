import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pkm_mobile/pages/component/bottomnavbar%20.dart';
import 'reminder.dart'; // Import model Reminder

class Pengingat extends StatefulWidget {
  @override
  _PengingatState createState() => _PengingatState();
}

class _PengingatState extends State<Pengingat> {
  final List<Reminder> reminders = [];

  void _addReminder(Reminder reminder) {
    setState(() {
      reminders.add(reminder);
    });
  }

  void _showAddReminderDialog() {
    final TextEditingController titleController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Reminder'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              SizedBox(height: 16),
              Text('Date: ${selectedDate.toLocal()}'),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? date = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (date != null && date != selectedDate) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },
                child: Text('Select Date'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final reminder = Reminder(
                    title: titleController.text,
                    dateTime: selectedDate,
                  );
                  _addReminder(reminder);
                  Navigator.pop(context);
                },
                child: Text('Add Reminder'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengingat'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _showAddReminderDialog,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: reminders.length,
        itemBuilder: (context, index) {
          final reminder = reminders[index];
          return ListTile(
            title: Text(reminder.title),
            subtitle: Text('${reminder.dateTime.toLocal()}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  reminders.removeAt(index);
                });
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
