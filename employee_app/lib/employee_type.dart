// doubt

import 'package:flutter/material.dart';

class EmploymentTypeSelector extends StatefulWidget {
  const new({super.key});

  @override
  State<EmploymentTypeSelector> createState() => _EmploymentTypeSelectorState();
}

class _EmploymentTypeSelectorState extends State<EmploymentTypeSelector> {
  String? employmentType = 'Full-time';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Employment Type',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        RadioGroup(
          groupValue: employmentType,
          onChanged: (value) {
           
          setState(() {
                employmentType = value; //doubt
          });
              
            
          },
          child: Column(
            children: [
              RadioListTile(title: Text('Full-time'), value: 'Full-time'),
              RadioListTile(title: Text('part-time'), value: 'Part-time'),
              RadioListTile(title: Text('Intern'), value: 'Intern'),
            ],
          ),
        ),
      ],
    );
  }
}