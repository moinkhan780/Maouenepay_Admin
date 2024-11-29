import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:maouenepay_admin/providers/navigation_provider.dart';
import 'package:maouenepay_admin/router/app_router.dart';
import 'package:maouenepay_admin/theme/colors.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/views/admins/admins.dart';
import 'package:maouenepay_admin/views/agents/agents.dart';
import 'package:maouenepay_admin/views/business_management/business_management.dart';
import 'package:maouenepay_admin/views/dashboard/dashboard.dart';
import 'package:maouenepay_admin/views/transer_management/transfer_management.dart';
import 'package:maouenepay_admin/views/users/users.dart';
import 'package:maouenepay_admin/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../../../utils/helper.dart';
import '../../../../widgets/buttons.dart';

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return "Dashboard";
    case 1:
      return "Users";
    case 2:
      return "Transfer Management";
    case 3:
      return "Business Management";
    case 4:
      return "Admins";
    case 5:
      return "Agents";
    default:
      return "Page not found";
  }
}

List<String> sidebarKeys = [
  "Dashboard",
  "Users",
  "Transfer Management",
  "Business Management",
  "Admins",
  "Agents",
];

class CustomSidebar extends StatefulWidget {
  const CustomSidebar({super.key});

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final List<Widget> pageContents = const [
    Dashboard(),
    Users(),
    TransferManagement(),
    BusinessManagement(),
    Admins(),
    Agents(),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    return Scaffold(
      key: _key,
      appBar: Responsive.isMobile()
          ? AppBar(
              title: TextWidget(getTitleByIndex(provider.controller.selectedIndex)),
              leading: IconButton(
                onPressed: () {
                  _key.currentState?.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
              actions: [
                if (provider.controller.selectedIndex == 1) ...{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () => AppRoutes.router.pushNamed(AppRoutes.ADD_USER),
                      text: "Add a user",
                    ),
                  ),
                } else if (provider.controller.selectedIndex == 2) ...{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () => AppRoutes.router.pushNamed(AppRoutes.ADD_BUSINESS),
                      text: "Add a business",
                    ),
                  ),
                } else if (provider.controller.selectedIndex == 4) ...{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () => AppRoutes.router.pushNamed(AppRoutes.ADD_ADMIN),
                      text: "Add a admin",
                    ),
                  ),
                } else if (provider.controller.selectedIndex == 5) ...{
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomButton(
                      onPressed: () => AppRoutes.router.pushNamed(AppRoutes.ADD_AGENT),
                      text: "Add a agent",
                    ),
                  ),
                }
              ],
            )
          : null,
      drawer: Sidebar(controller: provider.controller),
      body: Row(
        children: [
          if (!Responsive.isMobile()) Sidebar(controller: provider.controller),
          Expanded(
            child: Center(
              child: AnimatedBuilder(
                animation: provider.controller,
                builder: (context, child) {
                  final selectedIndex = provider.controller.selectedIndex;
                  return (selectedIndex >= 0 && selectedIndex < pageContents.length) ? pageContents[selectedIndex] : const SizedBox();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key, required SidebarXController controller}) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      showToggleButton: false,
      controller: _controller,
      theme: SidebarXTheme(
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.circular(100),
        ),
        hoverColor: Colors.grey.shade300,
        textStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w600, color: Colors.white),
        selectedTextStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w600),
        hoverTextStyle: TextStyle(fontSize: 14.spMin, fontWeight: FontWeight.w600),
        itemTextPadding: const EdgeInsets.only(left: 20),
        selectedItemTextPadding: const EdgeInsets.only(left: 20),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        itemPadding: const EdgeInsets.symmetric(vertical: 8),
        selectedItemPadding: const EdgeInsets.symmetric(vertical: 8),
        itemMargin: const EdgeInsets.symmetric(horizontal: 8),
        selectedItemMargin: const EdgeInsets.symmetric(horizontal: 8),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          gradient: LinearGradient(
            colors: [Colors.grey.shade300, Colors.grey.shade300],
          ),
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 300,
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
      ),
      footerBuilder: (context, extended) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                color: Colors.white,
                textColor: kPrimaryColor,
                fullWidth: true,
                onPressed: () {
                  AppRoutes.router.goNamed(AppRoutes.LOGIN);
                },
                text: "Logout",
              ),
            ],
          ),
        );
      },
      headerBuilder: (context, extended) {
        return Padding(
          padding: Responsive.getSymmetricPadding(horizontal: 16, vertical: 24),
          child: const TextWidget(
            "Maouene Pay",
            fontWeight: FontWeight.w600,
            fontSize: 24,
            color: Colors.white,
          ),
        );
      },
      items: List.generate(
        sidebarKeys.length,
        (index) {
          final labelKey = sidebarKeys[index];
          return SidebarXItem(
              iconBuilder: (selected, hovered) => const SizedBox(),
              label: labelKey,
              onTap: () {
                popDrawer(context);
                context.read<NavigationProvider>().notify();
              });
        },
      ),
    );
  }
}
