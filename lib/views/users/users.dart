import 'package:data_table_2/data_table_2.dart';
import 'package:faker/faker.dart'; // Import the faker package
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maouenepay_admin/router/app_router.dart';
import 'package:maouenepay_admin/theme/colors.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/widgets/buttons.dart';
import 'package:maouenepay_admin/widgets/text_widget.dart';

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  late List<Map<String, dynamic>> users; // Define the users list

  @override
  void initState() {
    super.initState();
    users = _generateRandomUsers(50); // Generate 50 random users
  }

  List<Map<String, dynamic>> _generateRandomUsers(int count) {
    var faker = Faker();
    return List.generate(count, (index) {
      return {
        'name': faker.person.name(),
        'pay': '${faker.randomGenerator.integer(1000, min: 500)} CDF',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile() ? null : _buildAppBar(),
      body: Container(
        margin: Responsive.getAllPadding(24),
        child: _buildDataTable(),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: const Text("Users"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              onPressed: () => AppRoutes.router.pushNamed(AppRoutes.ADD_USER),
              text: "Add a user",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDataTable() {
    return PaginatedDataTable2(
      showCheckboxColumn: false,
      showFirstLastButtons: false,
      renderEmptyRowsInTheEnd: false,
      minWidth: 1.sh,
      columnSpacing: 12,
      columns: const [
        DataColumn2(size: ColumnSize.L, label: TextWidget("Name", fontWeight: FontWeight.bold)),
        DataColumn2(size: ColumnSize.L, label: TextWidget("Pay", fontWeight: FontWeight.bold)),
        DataColumn2(size: ColumnSize.L, label: TextWidget("Options", fontWeight: FontWeight.bold)),
      ],
      source: _UsersDataSource(users: users, context: context),
    );
  }
}

class _UsersDataSource extends DataTableSource {
  final List<Map<String, dynamic>> users;
  final BuildContext context;

  _UsersDataSource({required this.users, required this.context});

  @override
  DataRow getRow(int index) {
    final user = users[index];
    return DataRow2.byIndex(
      color: index.isEven ? WidgetStateProperty.all(kBorder.withOpacity(0.2)) : null,
      index: index,
      cells: [
        DataCell(
          TextWidget(user['name'].toString()),
        ),
        DataCell(
          TextWidget(user['pay'].toString()),
        ),
        DataCell(
          Row(
            children: [
              IconButton(
                color: Colors.red,
                icon: const Icon(Icons.delete),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  AppRoutes.router.pushNamed(AppRoutes.USER_DETAIL);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
