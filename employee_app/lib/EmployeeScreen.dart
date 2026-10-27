import 'package:employee_app/skills_widgets.dart';
import 'package:employee_app/employee_type.dart';
import 'package:employee_app/switchList_widget.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Directory'),
        backgroundColor: const Color.fromARGB(255, 238, 205, 205),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Search Employeee",
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.clear),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: 'Department',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                initialValue: 'All',
                items: [
                  DropdownMenuItem(value: 'All', child: Text('All')),
                  DropdownMenuItem(value: 'Sales', child: Text('Sales')),
                  DropdownMenuItem(value: 'HR', child: Text('HR')),
                  DropdownMenuItem(
                    value: 'Inventory',
                    child: Text('Inventory'),
                  ),
                  DropdownMenuItem(value: 'Accounts', child: Text('Accounts')),
                ],
                onChanged: (value) {},
              ),
              SizedBox(height: 16),
              Column(
                children: [
                  // 1
                  ListTile(
                    leading: CircleAvatar(child: Text('MN')),
                    title: Text('Muhammed Nabeel'),
                    subtitle: Text('Flutter Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call, color: Colors.red),
                    ),
                  ),
                  // 2
                  ListTile(
                    leading: CircleAvatar(child: Text('AN')),
                    title: Text('Anil'),
                    subtitle: Text('Python Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  // 3
                  ListTile(
                    leading: CircleAvatar(child: Text('SU')),
                    title: Text('Sunil'),
                    subtitle: Text('Java Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  // 4
                  ListTile(
                    leading: CircleAvatar(child: Text('RH')),
                    title: Text('Rahul'),
                    subtitle: Text('.Net Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  // 5
                  ListTile(
                    leading: CircleAvatar(child: Text('AD')),
                    title: Text('Adil'),
                    subtitle: Text('Python Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  // 6
                  ListTile(
                    leading: CircleAvatar(child: Text('MN')),
                    title: Text('Manu'),
                    subtitle: Text('Django Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  // 7
                  ListTile(
                    leading: CircleAvatar(child: Text('KH')),
                    title: Text('Kahn'),
                    subtitle: Text('Flutter Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  // 8
                  ListTile(
                    leading: CircleAvatar(child: Text('JH')),
                    title: Text('John'),
                    subtitle: Text('Python Developer'),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.call),
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Add Employee',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),

                  TextField(
                    decoration: InputDecoration(
                      label: Text('Name:'),
                      hint: Text('Enter Name'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      hint: Text('Enter Email ID'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      label: Text('Employee ID'),
                      hint: Text('ID'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),
                  const EmployeeSkillsChips(),
                  // Text(
                  //   'Skills',
                  //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  // ),
                  // Wrap(
                  //   spacing: 8.0,
                  //   children: [
                  //     Chip(onDeleted: () {}, label: Text('Flutter')),
                  //     Chip(label: Text('Odoo')),
                  //     Chip(label: Text('Excel')),
                  //     Chip(label: Text('Communication')),
                  //   ],
                  // ),
                  SizedBox(height: 16),
                  const EmploymentTypeSelector(),
                  const EmployeOptions(),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
                          backgroundColor: const Color.fromARGB(255, 197, 100, 100),
                          foregroundColor: Colors.black,
                        ),
                        child: Text('Add'),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          foregroundColor: const Color.fromARGB(255, 216, 195, 195),
                          side: BorderSide(color: Colors.black),
                        ),
                        
                        child: Text('Reset'),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom( shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10)
                        ),
                          backgroundColor: const Color.fromARGB(255, 197, 100, 100),
                          foregroundColor: Colors.black,
                        ),
                        child: Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 80)
            ],
          ),
        ),
      
      ),
    );
  }
}











