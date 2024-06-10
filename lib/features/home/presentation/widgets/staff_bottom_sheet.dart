import 'package:flutter/material.dart';
import 'package:timesheet_app/core/utility_functions/show_snackbar.dart';
import 'package:timesheet_app/features/home/domain/entities/lodging.dart';
import 'package:timesheet_app/features/home/domain/entities/staff.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_dropdown.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_textfield.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_typeahead.dart';

class StaffBottomSheet extends StatefulWidget {
  final bool isEdit;
  final int? selectedStaffIndex;
  final Staff? staff;
  final List<Lodging> lodgingsRecords;
  final List<Staff> staffRecords;
  final VoidCallback onStaffUpdated;

  const StaffBottomSheet({
    super.key,
    required this.isEdit,
    this.selectedStaffIndex,
    this.staff,
    required this.lodgingsRecords,
    required this.staffRecords,
    required this.onStaffUpdated,
  });

  @override
  _StaffBottomSheetState createState() => _StaffBottomSheetState();
}

class _StaffBottomSheetState extends State<StaffBottomSheet> {
  final staffNameController = TextEditingController();
  final commentController = TextEditingController();
  final tasksController = TextEditingController();
  final startDayController = TextEditingController();
  final arriveFieldController = TextEditingController();
  final departFieldController = TextEditingController();
  final endDayController = TextEditingController();

  String? lodgingName;
  String? accommodationValue;
  String? perDiemValue;
  late List<String> lodgingNames;

  @override
  void initState() {
    super.initState();
    if (widget.lodgingsRecords.isEmpty) {
      lodgingNames = [];
    } else {
      lodgingNames =
          widget.lodgingsRecords.map((lodging) => lodging.lodgingName).toList();
    }

    if (widget.isEdit && widget.staff != null) {
      _populateFieldsForEdit(widget.staff!);
    }
  }

  @override
  void dispose() {
    staffNameController.dispose();
    commentController.dispose();
    tasksController.dispose();
    startDayController.dispose();
    arriveFieldController.dispose();
    departFieldController.dispose();
    endDayController.dispose();
    super.dispose();
  }

  void _populateFieldsForEdit(Staff staff) {
    staffNameController.text = staff.staffName;
    lodgingName = staff.lodging.lodgingName;
    commentController.text = staff.comment;
    tasksController.text = staff.tasks;
    accommodationValue = staff.accommodation;
    perDiemValue = staff.perDiem;
    startDayController.text = staff.startDay;
    arriveFieldController.text = staff.arriveField;
    departFieldController.text = staff.departField;
    endDayController.text = staff.endDay;
  }

  bool _validateFields() {
    return staffNameController.text.isNotEmpty &&
        lodgingName != null &&
        commentController.text.isNotEmpty &&
        tasksController.text.isNotEmpty &&
        accommodationValue != null &&
        perDiemValue != null &&
        startDayController.text.isNotEmpty &&
        arriveFieldController.text.isNotEmpty &&
        departFieldController.text.isNotEmpty &&
        endDayController.text.isNotEmpty;
  }

  void _addStaff() {
    if (_validateFields()) {
      final selectedLodging = widget.lodgingsRecords
          .firstWhere((lodging) => lodging.lodgingName == lodgingName);

      final newStaff = Staff(
        staffName: staffNameController.text,
        lodging: selectedLodging,
        comment: commentController.text,
        tasks: tasksController.text,
        accommodation: accommodationValue!,
        perDiem: perDiemValue!,
        startDay: startDayController.text,
        arriveField: arriveFieldController.text,
        departField: departFieldController.text,
        endDay: endDayController.text,
      );

      widget.staffRecords.add(newStaff);
      widget.onStaffUpdated();

      Navigator.pop(context);
    } else {
      showSnackBar(
        context: context,
        message: 'Please fill out all fields.',
        bgColor: Colors.black12,
      );
    }
  }

  void _editStaff() {
    if (_validateFields()) {
      final selectedLodging = widget.lodgingsRecords
          .firstWhere((lodging) => lodging.lodgingName == lodgingName);

      final editedStaff = Staff(
        staffName: staffNameController.text,
        lodging: selectedLodging,
        comment: commentController.text,
        tasks: tasksController.text,
        accommodation: accommodationValue!,
        perDiem: perDiemValue!,
        startDay: startDayController.text,
        arriveField: arriveFieldController.text,
        departField: departFieldController.text,
        endDay: endDayController.text,
      );

      widget.staffRecords[widget.selectedStaffIndex!] = editedStaff;
      print(widget.staffRecords[widget.selectedStaffIndex!].staffName);

      widget.onStaffUpdated();

      Navigator.pop(context);
    } else {
      showSnackBar(
        context: context,
        message: 'Please fill out all fields.',
        bgColor: Colors.black12,
      );
    }
  }

  Future<void> _selectTime1(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final period = picked.period == DayPeriod.am ? 'AM' : 'PM';
      final selectedTime =
          '${picked.hourOfPeriod == 0 ? 12 : picked.hourOfPeriod}:${picked.minute.toString().padLeft(2, '0')} $period';
      setState(() {
        startDayController.text = selectedTime;
      });
    }
  }

  Future<void> _selectTime2(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final period = picked.period == DayPeriod.am ? 'AM' : 'PM';
      final selectedTime =
          '${picked.hourOfPeriod == 0 ? 12 : picked.hourOfPeriod}:${picked.minute.toString().padLeft(2, '0')} $period';
      setState(() {
        endDayController.text = selectedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('staff bottom sheet build');
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.isEdit)
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        widget.staffRecords
                            .removeAt(widget.selectedStaffIndex!);
                        widget.onStaffUpdated();
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: Colors.red,
                        size: 30,
                      ),
                    ),
                  ),
                const Text(
                  'Staff Name',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                    controller: staffNameController, hintText: 'Staff Name'),
                const SizedBox(height: 10),
                const Text(
                  'Lodging',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomDropDown(
                  items: lodgingNames,
                  value: lodgingName,
                  onChanged: (value) {
                    setState(() {
                      lodgingName = value;
                    });
                  },
                  hintText: 'Select Lodging',
                ),
                const SizedBox(height: 10),
                const Text(
                  'Comment',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                    controller: commentController, hintText: 'Comment'),
                const SizedBox(height: 10),
                const Text(
                  'Tasks',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTypeAhead(
                  controller: tasksController,
                  hintText: 'Select a task',
                  list: const ['a', 'b', 'c'],
                  onSelectFunction: () {},
                ),
                const SizedBox(height: 10),
                const Text(
                  'Accommodation',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomDropDown(
                  items: const ['Local', 'Travel', 'Camp'],
                  value: accommodationValue,
                  onChanged: (value) {
                    setState(() {
                      accommodationValue = value;
                    });
                  },
                  hintText: 'Select Accommodation',
                ),
                const SizedBox(height: 10),
                const Text(
                  'Per Diem',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomDropDown(
                  items: const [
                    'a',
                    'b',
                    'c',
                  ],
                  value: perDiemValue,
                  onChanged: (value) {
                    setState(() {
                      perDiemValue = value;
                    });
                  },
                  hintText: 'Select Per Diem',
                ),
                const SizedBox(height: 10),
                const Text(
                  'Start Day',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: startDayController,
                  hintText: 'Start Day',
                  onTap: () {
                    _selectTime1(context);
                  },
                ),
                const SizedBox(height: 10),
                const Text(
                  'Arrive Field',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                    controller: arriveFieldController,
                    hintText: 'Arrive Field'),
                const SizedBox(height: 10),
                const Text(
                  'Depart Field',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                    controller: departFieldController,
                    hintText: 'Depart Field'),
                const SizedBox(height: 10),
                const Text(
                  'End Day',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 5),
                CustomTextField(
                  controller: endDayController,
                  hintText: 'End Day',
                  onTap: () {
                    _selectTime2(context);
                  },
                ),
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        if (widget.isEdit) {
                          _editStaff();
                        } else {
                          _addStaff();
                        }
                      },
                      child: Text(
                        widget.isEdit ? 'Edit' : 'Add',
                        style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
