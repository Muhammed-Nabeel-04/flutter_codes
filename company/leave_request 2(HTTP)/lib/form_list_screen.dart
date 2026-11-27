import 'package:go_router/go_router.dart';
import 'package:leave_request/data_model.dart';
import 'package:leave_request/form_fill_provider.dart';
import 'package:leave_request/form_list_provider.dart';
import 'package:leave_request/leave_repository.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class FormListScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<FormListScreen> createState() => _FormListScreenState();
}

class _FormListScreenState extends State<FormListScreen> {
  final repo = LeaveRepository();
  late Future<List<DataModel>> future;

  @override
  void initState() {
    super.initState();
    future = repo.fetchRequests();
  }

  void reload() {
    setState(() {
      future = repo.fetchRequests();
    });
  }

  // String fmt(DateTime d) => d.toString().split(' ')[0];

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
          final result = await context.push<bool>('/formfill', extra: null);
          if (result == true) reload();
        },
        
        child: Icon(Icons.add),
      ),

      body: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Could not load requests"),
                  const SizedBox(height: 12),
                ],
              ),
            );
          }

          final items = snapshot.data ?? [];
          if (items.isEmpty) {
            return const Center(child: Text('No leave request yet'));
          }

          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: items.length,

            separatorBuilder: (context, index) => const SizedBox(height: 20),
            itemBuilder: (context, idx) {
              final r = items[idx];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color.fromARGB(179, 204, 203, 203),
                ),
                child: ListTile(
                  title: Text(
                    '${r.leaveType} Leave',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: context.watch<FormListProvider>().textColor(
                        r.leaveType,
                      ),
                    ),
                  ),
                  // onTap: () async {
                  //   final result = await context.push<DataModel>(
                  //     '/formfill',
                  //     extra: leaveRequestDetails[idx],
                  //   );
                  //   if (result != null) {
                  //     leaveRequestDetails[idx] = result;
                  //   }
                  // },

                  subtitle: Text(
                    '${r.date.start.toString().split(' ')[0]}  to  ${r.date.end.toString().split(' ')[0]}',
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(r.halfDay ? 'HALF DAY' : 'FULL DAY'),
                      Text(
                        'Days: ${context.read<FormFillProvider>().countLeaveDays(r.date, r.halfDay)}',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
