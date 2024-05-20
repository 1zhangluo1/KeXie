import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/state_manager.dart';
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
  RxInt angle = 90.obs;
  RxBool floatButtonIsSelected = false.obs;
  RxDouble bottomToolbarHeight = 0.0.obs;
  RxList<ElevatedButton> bottomBarFunctions = [ElevatedButton(onPressed: (){}, child: Text(''))].obs;

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
                Login(
                  text: '2',
                ),
                Login(
                  text: '3',
                ),
                Profile(),
              ],
            ),
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                color: Colors.green,
                height: bottomToolbarHeight.value,
                width: MediaQuery.of(context).size.width,
                child: Wrap(
                  children: bottomBarFunctions,
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
              bottomToolbarHeight.value = MediaQuery.of(context).size.height / 6.5;
              bottomBarFunctions.value.clear();
              bottomBarFunctions.value.addAll([
                ElevatedButton(onPressed: ()=>print(111), child: Text('1111111')),
                ElevatedButton(onPressed: ()=>print(222), child: Text('莫')),
                ElevatedButton(onPressed: ()=>print(333), child: Text('楚')),
                ElevatedButton(onPressed: ()=>print(444), child: Text('楚')),
                ElevatedButton(onPressed: ()=>print(555), child: Text('我')),
                ElevatedButton(onPressed: ()=>print(666), child: Text('喜')),
                ElevatedButton(onPressed: ()=>print(777), child: Text('欢')),
                ElevatedButton(onPressed: ()=>print(888), child: Text('你')),
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
