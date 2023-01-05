import 'package:base_flutter/utils/theme_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../utils/image_util.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://media.comicbook.com/2018/04/super-dragon-balls-1097670.jpeg?auto=webp"),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: ImageUtil.loadNetWork(
                      url: 'https://avatarfiles.alphacoders.com/118/118945.png',
                      width: 100,
                      height: 100),
                ),
                const SizedBox(height: 12),
                const Text(
                  'G O K U',
                  style: TextStyle(fontSize: 18, fontWeight: MyFontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            title: const Text("Action 1"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Action 2"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
