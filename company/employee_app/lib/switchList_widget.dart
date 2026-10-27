import 'package:flutter/material.dart';

class EmployeOptions extends StatefulWidget {
  const new({super.key});

  @override
  State<EmployeOptions> createState() => _EmployeOptionsState();
}

class _EmployeOptionsState extends State<EmployeOptions> {
  bool isActive = true;
  bool isLaptop = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text('Active'),
          value: isActive,
          onChanged: (value) {
            setState(() {
              isActive = value;
            });
          },
        ),
        SwitchListTile(
          title: Text('Has Company Laptop'),
          value: isLaptop,
          onChanged: (value) {
            setState(() {
              isLaptop = value;
            });
          },
        ),
      ],
    );
  }
}
