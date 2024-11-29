import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:maouenepay_admin/theme/colors.dart';
import 'package:maouenepay_admin/theme/design_constant.dart';
import 'package:maouenepay_admin/widgets/text_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // States to keep track of the selected chips for each card
  bool isDaySelected = false;
  bool isMonthSelected = false;
  bool isYearSelected = false;

  PreferredSize _buildAppBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        title: const Text("Dashboard"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: Responsive.isMobile() ? null : _buildAppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile layout: Vertical list
            return _buildMobileLayout();
          } else {
            // Desktop/tablet layout: Grid
            return _buildGridLayout();
          }
        },
      ),
    );
  }

  // Helper method to build mobile layout
  Widget _buildMobileLayout() {
    return ListView(
      shrinkWrap: true,
      padding: Responsive.getAllPadding(24),
      children: <Widget>[
        _buildCard('Overall Volume', '145,000,000 CDF'),
        const Gap(10),
        _buildCard('Incoming Volume', '145,000,000 CDF'),
        const Gap(10),
        _buildCard('Outgoing Volume', '145,000,000 CDF'),
      ],
    );
  }

  // Helper method to build grid layout
  Widget _buildGridLayout() {
    return Container(
      padding: Responsive.getAllPadding(24),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.8,
        children: <Widget>[
          _buildCard('Overall Volume', '145,000,000 CDF'),
          _buildCard('Incoming Volume', '145,000,000 CDF'),
          _buildCard('Outgoing Volume', '145,000,000 CDF'),
        ],
      ),
    );
  }

  // Helper method to create a card with given parameters
  Widget _buildCard(String title, String subtitle) {
    return Card(
      child: Container(
        height: 300,
        padding: Responsive.getAllPadding(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Spacer(),
            TextWidget(
              title,
              fontSize: 13,
              color: kGreyText,
            ),
            const Gap(10),
            TextWidget(
              subtitle,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
            const Spacer(),
            _buildFilterChips(), // Add the filter chips below the subtitle
          ],
        ),
      ),
    );
  }

  // Helper method to build filter chips
  Widget _buildFilterChips() {
    return Wrap(
      spacing: 8.0,
      children: <Widget>[
        FilterChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          label: const Text('Day'),
          selected: isDaySelected,
          onSelected: (bool selected) {
            setState(() {
              isDaySelected = selected;
            });
          },
          selectedColor: kPrimaryColor,
        ),
        FilterChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          label: const Text('Month'),
          selected: isMonthSelected,
          onSelected: (bool selected) {
            setState(() {
              isMonthSelected = selected;
            });
          },
          selectedColor: kPrimaryColor,
        ),
        FilterChip(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          label: const Text('Year'),
          selected: isYearSelected,
          onSelected: (bool selected) {
            setState(() {
              isYearSelected = selected;
            });
          },
          selectedColor: kPrimaryColor,
        ),
      ],
    );
  }
}
