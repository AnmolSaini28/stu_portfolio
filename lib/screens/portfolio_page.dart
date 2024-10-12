// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../project_tab.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  // Variable to track the selected tab index
  int _selectedIndex = 0;

  // List of different screens/widgets that correspond to each BottomNavigationBar tab
  static final List<Widget> _widgetOptions = <Widget>[
    const Text('Home Screen'), // Home Tab Content (Replace with your content)
    const ProjectTab(), // Portfolio Tab Content (ProjectTab)
    const Text('Input Screen'), // Input Tab Content (Placeholder)
    const Text('Profile Screen'), // Profile Tab Content (Placeholder)
  ];

  // Function to handle BottomNavigationBar item taps
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected tab index
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text(
                'Portfolio',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
            actions: [
              SvgPicture.asset('assets/ic_round-shopping-bag.svg'),
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xffDF5532)),
                onPressed: () {},
              ),
            ],
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(
                  30.0), // Increase height to accommodate search bar
              child: Column(
                children: [
                  TabBar(
                    tabs: [
                      Tab(text: 'Project'),
                      Tab(text: 'Saved'),
                      Tab(text: 'Shared'),
                      Tab(text: 'Achievement'),
                    ],
                    labelColor: Color(0xffDF5532),
                    unselectedLabelColor: Color(0xff303030),
                    indicatorColor: Color(0xffDF5532),
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ],
              ),
            ),
          ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedLabelStyle: const TextStyle(color: Color(0xffDF5532)),
            unselectedLabelStyle: const TextStyle(color: Colors.grey),
            currentIndex:
                _selectedIndex, // This will highlight the selected tab
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/Home svg.svg',
                  color: _selectedIndex == 0
                      ? const Color(0xffDF5532)
                      : Colors.grey,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/Portfolia svg.svg',
                  color: _selectedIndex == 1
                      ? const Color(0xffDF5532)
                      : Colors.grey,
                ),
                label: 'Portfolio',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/Input svg@2x.svg',
                  color: _selectedIndex == 2
                      ? const Color(0xffDF5532)
                      : Colors.grey,
                ),
                label: 'Input',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  'assets/Profile svg.svg',
                  color: _selectedIndex == 3
                      ? const Color(0xffDF5532)
                      : Colors.grey,
                ),
                label: 'Profile',
              ),
            ],
            selectedItemColor:
                const Color(0xffDF5532), // Color of the selected item
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              color: Color(0xffDF5532),
            ),
            showUnselectedLabels: true, // Color of unselected items
            onTap: _onItemTapped, // Handle taps
          ),
          floatingActionButton: Container(
            margin: const EdgeInsets.only(left: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 110,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0xffDF5532),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/filter.svg',
                          height: 24,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
