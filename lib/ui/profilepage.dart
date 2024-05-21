import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:kexie_app/global/Global.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.cyan.shade100,
      ),
      body: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.cyan.shade100,
                      Colors.cyan.shade50,
                      Colors.white,
                    ]), //背景渐变
                borderRadius: BorderRadius.circular(3),
                boxShadow: const [
                  //阴影
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 8.0)
                ]),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 15, 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Global.isLogin.value
                          ? const Text('账户头像')
                          : ClipOval(
                              child: Image(
                              image: AssetImage(
                                  Assets.image.loginfailHeadimage.path),
                              fit: BoxFit.contain,
                              width: 70,
                              height: 70,
                            ))),
                      const SizedBox(
                        width: 25,
                      ),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '张洛',
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '软件部',
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            '学号：' '2300320225',
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: const Icon(Icons.arrow_forward_ios)))
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
