import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/homepage.dart';
import 'package:kexie_app/ui/login.dart';
import 'package:kexie_app/ui/profilepage.dart';

class MainStruct extends StatefulWidget {
  const MainStruct({super.key});

  @override
  State<MainStruct> createState() => _MainStructState();
}

class _MainStructState extends State<MainStruct> {
  int pageId = 0;
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            pageId = index;
          });
        },
        controller: _controller,
        children: const [
          MyHomePage(),
          Login(
            text: '2',
          ),
          Login(
            text: '3',
          ),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: "首页",
            tooltip: "首页",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_view),
            label: "课表",
            tooltip: "课表",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum),
            label: "论坛",
            tooltip: "论坛",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "我的",
            tooltip: "主页",
          ),
        ],
        onTap: (index) {
          _controller.animateToPage(index,
              duration: const Duration(
                  days: 0, hours: 0, minutes: 0, milliseconds: 250),
              curve: Curves.linear);
        },
        currentIndex: pageId,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
