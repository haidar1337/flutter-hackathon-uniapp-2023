import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:projectname/features/interactive-calendar/data/utils.dart';

final formatter = DateFormat.yMd();

class EventModal extends StatefulWidget {
  const EventModal({super.key, required this.onAddEvent, this.currentEvent});
  final Function(CalendarEvent) onAddEvent;
  final CalendarEvent? currentEvent;

  @override
  State<EventModal> createState() => _EventModalState();
}

class _EventModalState extends State<EventModal> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionControlloer = TextEditingController();
  @override
  void initState() {
    print(widget.currentEvent);
    if (widget.currentEvent != null) {
      _titleController.text = widget.currentEvent!.title;
      _descriptionControlloer.text = widget.currentEvent!.description!;
    }
    super.initState();
  }

  DateTime? _selectedDate;
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionControlloer.dispose();
    super.dispose();
  }

  void _showDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 40, now.month, now.day);
    final lastDate = DateTime(now.year, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitFormData() {
    if (_titleController.text.trim().isEmpty ||
        _descriptionControlloer.text.trim().isEmpty ||
        _selectedDate == null) {
      if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("Okay"),
                ),
              ],
              title: const Text("Invalid Input"),
              content: const Text(
                  "Please make sure you have entered a title, valid amount and a date to submit the form!"),
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text("Okay"),
              ),
            ],
            title: const Text("Invalid Input"),
            content: const Text(
                "Please make sure you have entered a title, valid amount and a date to submit the form!"),
          ),
        );
      }
      return;
    }
    final eventModal = CalendarEvent.all(
      _titleController.text.trim(),
      _descriptionControlloer.text.trim(),
      _selectedDate!,
    );

    _titleController.clear();
    _descriptionControlloer.clear();
    setState(() {
      _selectedDate = null;
    });
    widget.onAddEvent(eventModal);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 24, keyboardSpace + 24),
          child: SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: [
                TextField(
                  controller: _titleController,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 14,
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate != null
                          ? formatter.format(_selectedDate!)
                          : "Select a Date",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 14,
                          ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    IconButton(
                      onPressed: _showDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _descriptionControlloer,
                        maxLength: 120,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          prefix: Text(""),
                          labelText: 'Description',
                        ),
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  fontSize: 14,
                                ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // close modal
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _submitFormData,
                  child: const Text(
                    "Save Event",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
