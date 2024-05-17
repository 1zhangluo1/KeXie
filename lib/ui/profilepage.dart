import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:kexie_app/global/Global.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.all(25)),
        Card(
          margin: EdgeInsets.symmetric(horizontal: 6),
          surfaceTintColor: Colors.blue,
          elevation: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                            width: 60,
                            height: 60,
                          ))),
                    const SizedBox(
                      width: 15,
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '张洛',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          '软件部',
                          style: TextStyle(
                            fontSize: 14
                          ),
                        ),
                        Text(
                          '学号：' '2300320225',
                          style: TextStyle(
                              fontSize: 14
                          ),
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
    );
  }
}
