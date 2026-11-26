import 'package:go_router/go_router.dart';
import 'package:leave_request/data_model.dart';
import 'package:material_ui/material_ui.dart';
import 'package:leave_request/form_fill_provider.dart';
import 'package:provider/provider.dart';

class FormFillScreen extends StatefulWidget {
  final DataModel? input;
  const new({super.key, required this.input});

  @override
  State<FormFillScreen> createState() => _FormFillScreenState();
}

class _FormFillScreenState extends State<FormFillScreen> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    context.read<FormFillProvider>().initstate(widget.input);
    // });
  }

  @override
  Widget build(BuildContext context) {
    final formWatch = context.watch<FormFillProvider>();
    final formRead = context.watch<FormFillProvider>();
    // TextEditingController controller = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Leave Form',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              DropdownButtonFormField(
                hint: Text('Leave Type'),
                items: [
                  ...leaveTypeDropDown.map(
                    (p) => DropdownMenuItem(value: p, child: Text(p)),
                  ),
                ],
                initialValue: formRead.leaveType,
                onChanged: (value) {
                  setState(() {
                    formRead.leaveType = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'Select a leave type' : null,
              ),

              SizedBox(height: 30),

              FormField(
                validator: (value) {
                  final range = formRead.dateRange;

                  if (range == null) return 'Select from and to dates';
                  if (formRead.countLeaveDays(range, false) == 0) {
                    return 'Selected dates are only weekends';
                  }
                  return null;
                },

                builder: (field) => InkWell(
                  onTap: () =>

                     context.read<FormFillProvider>().datepicker(context),

                  child: InputDecorator(
                    decoration: InputDecoration(
                     
                      labelText: "leave From - To",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.calendar_month),
                      errorText: field.errorText
                    ),

                    child: Text(
                      formWatch.dateRange == null
                          ? "selecet from and to dates"
                          : '${formWatch.dateRange!.start.toString().split(' ')[0]} to ${formWatch.dateRange!.end.toString().split(' ')[0]}',
                      // : '${formWatch.dateRange}',
                    ),
                  ),
                ),
              ),

              Text(
                formWatch.dateRange != null
                    ? 'Total Days: ${formWatch.countLeaveDays(formWatch.dateRange!, formWatch.halfDay)}'
                    : '',
              ),

              SizedBox(height: 30),
              TextFormField(
                // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                minLines: 1,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Reason of Taking Leave",
                  border: OutlineInputBorder(),
                ),
                controller: formWatch.controller,
                validator: (value) =>
                    (value == null || value.trim().length < 10)
                    ? 'Minimum 10 characters'
                    : null,
              ),

              SizedBox(height: 30),

              SwitchListTile(
                value: context.watch<FormFillProvider>().halfDay,
                onChanged: (value) => formRead.toogleDay(value),
                title: Text('HALF Day'),
              ),

              SizedBox(height: 50),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // context.read<FormFillProvider>().resetButton();
                      formKey.currentState!.reset();
                      formRead.resetButton();
                    },
                    child: Text('Reset'),
                  ),
                  SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: () {
                      // if (formWatch.controller.text.length >= 10 &&
                      //     formWatch.dateRange != null &&
                      //     formRead.leaveType != null) {

                      if (formKey.currentState!.validate()) {
                        final result = formRead.apply();
                        context.pop(result);
                      } else {
                        null;
                      }
                    },
                    child: Text('Apply'),
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
