import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timesheet_app/core/common/utils/custom_text_style.dart';
import 'package:timesheet_app/core/common/widgets/colored_button.dart';
import 'package:timesheet_app/core/theme/app_colors.dart';
import 'package:timesheet_app/core/theme/brightness.dart';
import 'package:timesheet_app/core/theme/theme_colors.dart';
import 'package:timesheet_app/core/utility_functions/show_snackbar.dart';
import 'package:timesheet_app/features/home/domain/entities/lodging.dart';
import 'package:timesheet_app/features/home/domain/entities/multiproject.dart';
import 'package:timesheet_app/features/home/domain/entities/project.dart';
import 'package:timesheet_app/features/home/domain/entities/staff.dart';
import 'package:timesheet_app/features/home/domain/entities/type.dart';
import 'package:timesheet_app/features/home/domain/entities/user.dart';
import 'package:timesheet_app/features/home/domain/entities/vehicle.dart';
import 'package:timesheet_app/features/home/presentation/bloc/timesheet_bloc.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_button.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_dropdown.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_textfield.dart';
import 'package:timesheet_app/features/home/presentation/widgets/custom_typeahead.dart';
import 'package:timesheet_app/features/home/presentation/widgets/staff_bottom_sheet.dart';

class TimeSheetFormPage extends StatefulWidget {
  const TimeSheetFormPage({super.key});

  @override
  State<TimeSheetFormPage> createState() => _TimeSheetFormPageState();
}

class _TimeSheetFormPageState extends State<TimeSheetFormPage> {
  final userController = TextEditingController();
  final projectController = TextEditingController();
  final vehicleController = TextEditingController();
  final startKmController = TextEditingController();
  final endKmController = TextEditingController();
  final noteController = TextEditingController();
  final lodgingNameController = TextEditingController();
  final lodgingLocationController = TextEditingController();
  final noOfPeopleController = TextEditingController();

  String? type;
  String? multiProjectType;

  List<Lodging> lodgingsRecords = [];
  List<Staff> staffRecords = [];

  @override
  void initState() {
    context.read<TimesheetBloc>().add(TimeSheetFetchEvent());
    super.initState();
  }

  @override
  void dispose() {
    userController.dispose();
    projectController.dispose();
    vehicleController.dispose();
    startKmController.dispose();
    endKmController.dispose();
    noteController.dispose();
    lodgingNameController.dispose();
    lodgingLocationController.dispose();
    noOfPeopleController.dispose();
    super.dispose();
  }

  void _showLodgingBottomSheet(BuildContext context,
      {Lodging? lodging, bool isEdit = false, int? selectedLodgingIndex}) {
    lodgingNameController.text = lodging?.lodgingName ?? '';
    lodgingLocationController.text = lodging?.lodgingLocation ?? '';
    noOfPeopleController.text = lodging?.noOfPeople.toString() ?? '';

    showModalBottomSheet(
      context: context,
      builder: (context) => buildLodgingBottomSheet(
        isEdit: isEdit,
        selectedLodgingIndex: selectedLodgingIndex,
      ),
    );
  }

  void _showStaffBottomSheet(BuildContext context,
      {bool isEdit = false, Staff? staff, int? selectedStaffIndex}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => StaffBottomSheet(
        isEdit: isEdit,
        staff: staff,
        selectedStaffIndex: selectedStaffIndex,
        lodgingsRecords: lodgingsRecords,
        staffRecords: staffRecords,
        onStaffUpdated: _onStaffUpdated,
      ),
    );
  }
  void _onStaffUpdated() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ThemeColors.onPrimary(context)),
        backgroundColor: ThemeColors.primary(context),
        title: Text(
          'TimeSheet Form',
          style: CustomTextStyle.appBarTextStyle(context),
        ),
      ),
      body: BlocConsumer<TimesheetBloc, TimesheetState>(
        listener: (context, state) {
          if (state is TimesheetErrorState) {
            showSnackBar(
                context: context, message: state.message, bgColor: Colors.red);
          }
        },
        builder: (context, state) {
          if (state is TimesheetLoadingState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildShimmer(),
            );
          } else if (state is TimesheetLoadedState) {
            final List<User> users = state.timeSheet.users!;
            final List<Project> projects = state.timeSheet.projects!;
            final List<TypeClass> types = state.timeSheet.type!;
            final List<Vehicle> vehicles = state.timeSheet.vehicles!;
            final List<MultiProject> multiProjects =
                state.timeSheet.multiProjects!;
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'User',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomTypeAhead(
                                  controller: userController,
                                  hintText: 'Select User',
                                  list: users.map((e) => e.username).toList(),
                                  onSelectFunction: () {},
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Project',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomTypeAhead(
                                  controller: projectController,
                                  hintText: 'Select Project',
                                  list: projects
                                      .map((e) => e.projectName)
                                      .toList(),
                                  onSelectFunction: () {},
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Type',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomDropDown(
                                  items: types.map((e) => e.typeName).toList(),
                                  value: type,
                                  hintText: 'Select Type',
                                  onChanged: (val) {
                                    setState(() {
                                      type = val!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Vehicle',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomTypeAhead(
                                  controller: vehicleController,
                                  hintText: 'Choose a vehicle',
                                  list: vehicles
                                      .map((e) => e.vehicleName)
                                      .toList(),
                                  onSelectFunction: () {},
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Start KM',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  controller: startKmController,
                                  hintText: 'Start KM',
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'End KM',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  controller: endKmController,
                                  hintText: 'End KM',
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Multi Project',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomDropDown(
                                  items: multiProjects
                                      .map((e) => e.multiProject)
                                      .toList(),
                                  value: multiProjectType,
                                  hintText: 'Select Type',
                                  onChanged: (val) {
                                    setState(() {
                                      multiProjectType = val!;
                                    });
                                  },
                                ),
                                const SizedBox(height: 10),
                                const Text(
                                  'Note',
                                  style: TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 5),
                                CustomTextField(
                                  controller: noteController,
                                  hintText: 'Note',
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                color:
                                    getBrightness(context) == Brightness.light
                                        ? containerColorLight
                                        : containerColorDark,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'LODGINGS',
                                      style: TextStyle(
                                        color: getBrightness(context) ==
                                                Brightness.light
                                            ? textColorLight
                                            : textColorDark,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ColoredButton(
                                      iconData: Icons.add,
                                      onPressed: () {
                                        _showLodgingBottomSheet(context);
                                      },
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: lodgingsRecords.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final lodge = lodgingsRecords[index];
                                  return ListTile(
                                    title: Text(lodge.lodgingName),
                                    subtitle: Text(lodge.lodgingLocation),
                                    trailing: IconButton(
                                      onPressed: () {
                                        _showLodgingBottomSheet(
                                          context,
                                          lodging: lodge,
                                          isEdit: true,
                                          selectedLodgingIndex: index,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              Container(
                                padding: const EdgeInsets.all(12),
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? containerColorLight
                                    : containerColorDark,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'STAFF',
                                      style: TextStyle(
                                        color: getBrightness(context) ==
                                                Brightness.light
                                            ? textColorLight
                                            : textColorDark,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    ColoredButton(
                                      iconData: Icons.add,
                                      onPressed: () {
                                        _showStaffBottomSheet(context);
                                      },
                                      color: Colors.green,
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: staffRecords.length,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  final staff = staffRecords[index];
                                  return ListTile(
                                    title: Text(staff.staffName),
                                    subtitle: Text(staff.lodging.lodgingName),
                                    trailing: IconButton(
                                      onPressed: () {
                                        _showStaffBottomSheet(
                                          context,
                                          staff: staff,
                                          isEdit: true,
                                          selectedStaffIndex: index,
                                        );
                                        //
                                      },
                                      icon: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                      ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
                    child: CustomButton(
                      buttonWidget: Text(
                        'Submit',
                        style: TextStyle(
                          color: ThemeColors.onPrimary(context),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget buildLodgingBottomSheet(
      {required bool isEdit, int? selectedLodgingIndex}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isEdit)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  lodgingsRecords.removeAt(selectedLodgingIndex!);
                  setState(() {});
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
            'Name',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: lodgingNameController,
            hintText: 'Name',
          ),
          const SizedBox(height: 10),
          const Text(
            'Location',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: lodgingLocationController,
            hintText: 'Location',
          ),
          const SizedBox(height: 10),
          const Text(
            'No Of People',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 5),
          CustomTextField(
            controller: noOfPeopleController,
            hintText: 'No Of People',
            inputType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ThemeColors.primary(context),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (isEdit) {
                    _editLodging(index: selectedLodgingIndex!);
                  } else {
                    _addLodging();
                  }
                  setState(() {});
                },
                child: Text(
                  isEdit ? 'Edit' : 'Add',
                  style: TextStyle(
                    color: ThemeColors.onPrimary(context),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmer() {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDarkMode ? Colors.grey[700]! : Colors.grey[300]!;
    final highlightColor = isDarkMode ? Colors.grey[500]! : Colors.grey[100]!;
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: 100, height: 20, color: Colors.white),
                const SizedBox(height: 5),
                Container(
                    width: double.infinity, height: 50, color: Colors.white),
                const SizedBox(height: 10),
              ],
            ),
          );
        },
      ),
    );
  }

  void _addLodging() {
    if (lodgingNameController.text.isNotEmpty &&
        lodgingLocationController.text.isNotEmpty &&
        noOfPeopleController.text.isNotEmpty) {
      final lodging = Lodging(
          lodgingName: lodgingNameController.text,
          lodgingLocation: lodgingLocationController.text,
          noOfPeople: int.parse(noOfPeopleController.text));
      lodgingsRecords.add(lodging);
      lodgingNameController.clear();
      lodgingLocationController.clear();
      noOfPeopleController.clear();
    }
    Navigator.pop(context);
  }

  void _editLodging({required int index}) {
    if (lodgingNameController.text.isNotEmpty &&
        lodgingLocationController.text.isNotEmpty &&
        noOfPeopleController.text.isNotEmpty) {
      final lodging = Lodging(
        lodgingName: lodgingNameController.text,
        lodgingLocation: lodgingLocationController.text,
        noOfPeople: int.parse(noOfPeopleController.text),
      );

      if (index >= 0 && index < lodgingsRecords.length) {
        lodgingsRecords.removeAt(index);
        lodgingsRecords.insert(index, lodging);
      }

      lodgingNameController.clear();
      lodgingLocationController.clear();
      noOfPeopleController.clear();
      Navigator.pop(context);
    }
  }
}
