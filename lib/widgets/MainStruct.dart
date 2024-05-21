import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/ui/class_schedule_page.dart';
import 'package:kexie_app/ui/forumpage.dart';
import 'package:kexie_app/ui/homepage.dart';
import 'package:kexie_app/ui/login.dart';
import 'package:kexie_app/ui/profilepage.dart';
import 'package:kexie_app/widgets/ContainImageButton.dart';

class MainStruct extends StatefulWidget {
  const MainStruct({super.key});

  @override
  State<MainStruct> createState() => _MainStructState();
}

class _MainStructState extends State<MainStruct> {
  int pageId = 0;
  final PageController _controller = PageController();
  RxInt angle = 90.obs;
  RxBool floatButtonIsSelected = false.obs;
  RxDouble bottomToolbarHeight = 0.0.obs;
  RxList<ContainImageButton> bottomBarFunctions = [ const ContainImageButton(background: Colors.orange, icon: Icons.event_available, label: '签到'),].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () {
          if (floatButtonIsSelected.value) {
            angle.value = 0;
            bottomToolbarHeight.value = 0;
            bottomBarFunctions.clear();
            floatButtonIsSelected.value = !floatButtonIsSelected.value;
          } else if (!floatButtonIsSelected.value) {}
        },
        child: Obx(
            () => Stack(children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  pageId = index;
                });
              },
              controller: _controller,
              children: const [
                MyHomePage(),
                ClassSchedule(),
                Forum(),
                Profile(),
              ],
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: (){},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
                    border: Border.all(width: 0.25,color: Colors.grey),
                  ),
                  height: bottomToolbarHeight.value,
                  width: MediaQuery.of(context).size.width,
                  child: Wrap(
                    children: bottomBarFunctions,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue[300],
          child: AnimatedRotation(
              turns: angle.value / 360,
              duration: const Duration(milliseconds: 300),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              )),
          onPressed: () {
            if (floatButtonIsSelected.value) {
              angle.value = 0;
              bottomToolbarHeight.value = 0;
              bottomBarFunctions.clear();
            } else {
              angle.value += 360 * 1 + 45;
              bottomToolbarHeight.value = MediaQuery.of(context).size.height / 3.6;
              bottomBarFunctions.clear();
              bottomBarFunctions.addAll([
                ContainImageButton(background: Colors.orange, icon: Icons.event_available, label: '签到',event: () => print(123000),),
                ContainImageButton(background: Colors.deepPurpleAccent, icon: Icons.equalizer, label: '打卡统计'),
                ContainImageButton(background: Colors.pinkAccent, icon: Icons.add_reaction, label: '科协招新'),
                ContainImageButton(background: Colors.blueGrey, icon: Icons.token, label: '科协黑科技'),
                ContainImageButton(background: Colors.greenAccent, icon: Icons.web, label: '科协官网'),
                ContainImageButton(background: Colors.yellow, icon: Icons.book, label: '图书借阅'),
                ContainImageButton(background: Colors.blueAccent, icon: Icons.cloud_download, label: '科协网盘'),
                ContainImageButton(background: Colors.redAccent, icon: Icons.login, label: '登录',event: () => Get.toNamed(AppRoute.loginPage),),
              ]
              );
            }
            floatButtonIsSelected.value = !floatButtonIsSelected.value;
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      shadowColor: Colors.black,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      elevation: 5,
      height: 60,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          bottomItem(
            0,
            Icons.school,
            "首页",
          ),
          bottomItem(1, Icons.table_view, "课表"),
          const SizedBox(
            width: 40,
          ),
          bottomItem(2, Icons.forum, "论坛"),
          bottomItem(3, Icons.person, "我的"),
        ],
      ),
    );
  }

  Widget bottomItem(int index, IconData? icon, String title,
      {Color? color = Colors.grey}) {
    return Expanded(
      flex: 1,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            pageId = index;
            _controller.animateToPage(index,
                duration: const Duration(
                    days: 0, hours: 0, minutes: 0, milliseconds: 250),
                curve: Curves.linear);
          });
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: pageId == index ? Colors.cyan : color,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
