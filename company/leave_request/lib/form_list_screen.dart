import 'package:go_router/go_router.dart';
import 'package:leave_request/data_model.dart';
import 'package:leave_request/form_list_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class FormListScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FormListScreen> createState() => _FormListScreenState();
}

class _FormListScreenState extends State<FormListScreen> {
  @override
  Widget build(BuildContext context) {
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

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push<DataModel>(
            '/formfill',
            extra: null,
          );
          if (result != null) {
            // if (leaveRequestDetails.contains(result)){
            //   final idx = leaveRequestDetails.indexOf(result);
            //   leaveRequestDetails[idx] = result;
            // }
            // else{
            setState(() {
              leaveRequestDetails.add(result);
            });

            // }
          }
        },
        child: Icon(Icons.add),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 20),
                itemCount: leaveRequestDetails.length,
                itemBuilder: (context, idx) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color.fromARGB(179, 204, 203, 203),
                    ),
                    child: ListTile(
                      onTap: () async {
                        final result = await context.push<DataModel>(
                          '/formfill',
                          extra: leaveRequestDetails[idx],
                        );
                        if (result != null) {
                          leaveRequestDetails[idx] = result;
                        }
                      },

                      title: Text(
                        '${leaveRequestDetails[idx].leaveType} Leave',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.watch<FormListProvider>().textColor(
                            leaveRequestDetails[idx].leaveType,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        '${leaveRequestDetails[idx].date.start.toString().split(' ')[0]}  to  ${leaveRequestDetails[idx].date.end.toString().split(' ')[0]}',
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            leaveRequestDetails[idx].halfDay
                                ? 'HALF DAY'
                                : 'FULL DAY',
                          ),
                          Text(
                            'Days: ${leaveRequestDetails[idx].numberOfDays}',
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
