import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class Calculator extends StatefulWidget {
//   final String? number;
//   const Calculator({Key? key, this.number}) : super(key: key);

//   @override
//   State<Calculator> createState() => _CalculatorState();
// }

// class _CalculatorState extends State<Calculator>
//     with SingleTickerProviderStateMixin {
//   final double _closedDrawerWidth = 56;
//   final double _openedDrawerWidth = 220;

//   late final AnimationController _controller;
//   late final Animation<double> _widthAnimation;
//   late final Animation<double> _textOpacityAnimation;

//   bool _isHovering = false;
//   bool _showTexts = false;
//   int? _hoveredItemIndex;

//   final List<DrawerItem> _drawerItems = [
//     DrawerItem(icon: Icons.home, title: 'خانه', route: "/Home"),
//     DrawerItem(icon: Icons.settings, title: 'تنظیمات'),
//     DrawerItem(icon: Icons.person, title: 'Profile'),
//     DrawerItem(icon: Icons.notifications, title: 'اعلانات'),
//     DrawerItem(
//       icon: Icons.calculate,
//       title: 'ماشین حساب',
//       route: "/Calculator",
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 300),
//     );

//     _widthAnimation = Tween<double>(
//       begin: _closedDrawerWidth,
//       end: _openedDrawerWidth,
//     ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

//     _textOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(
//         parent: _controller,
//         curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _openDrawer() async {
//     setState(() => _isHovering = true);
//     await _controller.forward();
//     setState(() => _showTexts = true);
//   }

//   Future<void> _closeDrawer() async {
//     setState(() {
//       _showTexts = false;
//       _hoveredItemIndex = null;
//     });
//     await _controller.reverse();
//     setState(() => _isHovering = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('دراور هاوری'),
//         backgroundColor: const Color.fromARGB(255, 150, 204, 247),
//       ),
//       body: Stack(
//         children: [
//           // Main Content
//           Container(
//             color: Colors.white,
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 70, right: 20),
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20),
//                     Text("ماشین حساب"),
//                     Expanded(
//                       flex: 3,
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: 20.0),
//                             child: Text("0", style: TextStyle(fontSize: 35.0)),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Expanded(
//                       flex: 4,
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 but("/"),
//                                 but("1"),
//                                 but("4"),
//                                 but("7"),
//                                 but("ac"),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 but("()"),
//                                 but("2"),
//                                 but("5"),
//                                 but("8"),
//                                 but("0"),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 but("*"),
//                                 but("3"),
//                                 but("6"),
//                                 but("9"),
//                                 but("."),
//                               ],
//                             ),
//                           ),
//                           Expanded(
//                             child: Column(
//                               children: [
//                                 but("-"),
//                                 but("+", fl: 2),
//                                 but("=", fl: 2),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // Drawer Section
//           Positioned(
//             left: 0,
//             top: 0,
//             bottom: 0,
//             child: MouseRegion(
//               onEnter: (_) => _openDrawer(),
//               onExit: (_) => _closeDrawer(),
//               child: AnimatedBuilder(
//                 animation: _controller,
//                 builder: (context, child) {
//                   return Material(
//                     elevation: 16,
//                     child: Container(
//                       width: _widthAnimation.value,
//                       decoration: BoxDecoration(
//                         color: Colors.grey[200],
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.2),
//                             blurRadius: 12,
//                             spreadRadius: 2,
//                           ),
//                         ],
//                       ),
//                       child: ListView(
//                         padding: EdgeInsets.zero,
//                         children: [
//                           const SizedBox(height: 16),
//                           ..._drawerItems.asMap().entries.map((entry) {
//                             final index = entry.key;
//                             final item = entry.value;
//                             return Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 4,
//                                 vertical: 2,
//                               ),
//                               child: Material(
//                                 color: Colors.transparent,
//                                 child: MouseRegion(
//                                   onEnter:
//                                       (_) => setState(
//                                         () => _hoveredItemIndex = index,
//                                       ),
//                                   onExit:
//                                       (_) => setState(
//                                         () => _hoveredItemIndex = null,
//                                       ),
//                                   child: AnimatedContainer(
//                                     duration: const Duration(milliseconds: 200),
//                                     decoration: BoxDecoration(
//                                       color:
//                                           _hoveredItemIndex == index
//                                               ? Colors.blue.withOpacity(0.1)
//                                               : Colors.transparent,
//                                       borderRadius: BorderRadius.circular(6),
//                                     ),
//                                     child: InkWell(
//                                       borderRadius: BorderRadius.circular(6),
//                                       onTap: () {
//                                         if (item.route != null) {
//                                           context.go(item.route!);
//                                           _closeDrawer();
//                                         }
//                                       },
//                                       child: Container(
//                                         constraints: BoxConstraints(
//                                           maxWidth: _openedDrawerWidth - 8,
//                                         ),
//                                         padding: const EdgeInsets.symmetric(
//                                           horizontal: 8,
//                                           vertical: 10,
//                                         ),
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               _widthAnimation.value ==
//                                                       _closedDrawerWidth
//                                                   ? MainAxisAlignment
//                                                       .center // مرکز چین در حالت بسته
//                                                   : MainAxisAlignment
//                                                       .start, // چپ چین در حالت باز
//                                           children: [
//                                             Icon(
//                                               item.icon,
//                                               size: 24,
//                                               color:
//                                                   _hoveredItemIndex == index
//                                                       ? Colors.blue
//                                                       : Colors.grey[700],
//                                             ),
//                                             if (_showTexts)
//                                               Padding(
//                                                 padding: const EdgeInsets.only(
//                                                   left: 8,
//                                                 ),
//                                                 child: Opacity(
//                                                   opacity:
//                                                       _textOpacityAnimation
//                                                           .value,
//                                                   child: SizedBox(
//                                                     width:
//                                                         _openedDrawerWidth - 80,
//                                                     child: Text(
//                                                       item.title,
//                                                       overflow:
//                                                           TextOverflow.ellipsis,
//                                                       style: TextStyle(
//                                                         fontSize: 14,
//                                                         color:
//                                                             _hoveredItemIndex ==
//                                                                     index
//                                                                 ? Colors.blue
//                                                                 : Colors
//                                                                     .grey[800],
//                                                         fontWeight:
//                                                             _hoveredItemIndex ==
//                                                                     index
//                                                                 ? FontWeight
//                                                                     .bold
//                                                                 : FontWeight
//                                                                     .normal,
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }).toList(),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DrawerItem {
//   final IconData icon;
//   final String title;
//   final String? route; // مسیر نویگیشن

//   const DrawerItem({required this.icon, required this.title, this.route});
// }

Widget but(String name, {int fl = 1}) {
  return Expanded(
    flex: fl,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, double.infinity),
        ),
        child: Text(name, style: TextStyle(fontSize: 14)),
      ),
    ),
  );
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70, right: 20, bottom: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text("ماشین حساب", style: TextStyle(fontSize: 24)),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text("0", style: TextStyle(fontSize: 35.0)),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      but("/"),
                      but("1"),
                      but("4"),
                      but("7"),
                      but("ac"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      but("()"),
                      but("2"),
                      but("5"),
                      but("8"),
                      but("0"),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      but("*"),
                      but("3"),
                      but("6"),
                      but("9"),
                      but("."),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [but("-"), but("+", fl: 2), but("=", fl: 2)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
