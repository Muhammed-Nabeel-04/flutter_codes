// doubt

import 'package:flutter/material.dart';

class EmployeeSkillsChips extends StatefulWidget {
  const new({super.key});

  @override
  State<EmployeeSkillsChips> createState() => _EmployeeSkillsChipsState();
}

class _EmployeeSkillsChipsState extends State<EmployeeSkillsChips> {
  List selectedSkills = [];
  final List skills = ['Flutter', 'Odoo', 'Excel', 'Communication',];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Skills',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: skills.map((skill) {
            return FilterChip(
              label: Text(skill),
              selected: selectedSkills.contains(skill),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedSkills.add(skill);
                  } else {
                    selectedSkills.remove(skill);
                  }
                });
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

