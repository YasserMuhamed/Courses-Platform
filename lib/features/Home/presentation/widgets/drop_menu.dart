import 'package:courses_platform/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DropMenu extends StatefulWidget {
  const DropMenu(
      {super.key, required this.courseName, required this.courseDescription});

  final String courseName;
  final String courseDescription;

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionPanelList(
        animationDuration: const Duration(milliseconds: 500),
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            this.isExpanded = isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            backgroundColor: AppColors.primaryColor,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return const ListTile(
                title: Text(
                  "Course Name",
                  style: TextStyle(
                    color: AppColors.altTextColor,
                    fontSize: 20,
                  ),
                ),
              );
            },
            canTapOnHeader: true,
            body: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              title: const Text(
                "Course Description",
                style: TextStyle(
                  color: AppColors.altTextColor,
                  fontSize: 16,
                ),
              ),
            ),
            isExpanded: isExpanded,
          ),
        ],
      ),
    );
  }
}



// Container(
//       margin: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: AppColors.primaryColor,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             offset: Offset(0, 2),
//             blurRadius: 4,
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const Text(
//                   "Course Name",
//                   style: TextStyle(
//                     color: AppColors.altTextColor,
//                     fontSize: 20,
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () {
//                       setState(() {
//                         isExpanded = !isExpanded;
//                       });
//                     },
//                     icon: isExpanded
//                         ? const Icon(Icons.arrow_drop_up_rounded)
//                         : const Icon(Icons.arrow_drop_down_rounded))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );