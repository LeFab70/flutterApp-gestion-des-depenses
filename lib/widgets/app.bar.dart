import 'package:flutter/material.dart';

class AppBars extends StatelessWidget implements PreferredSize{
  const AppBars({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100.00,
      leading: IconButton(onPressed: (){}, icon: Icon(Icons.shopping_bag_rounded)),
      title: Text("BUDG - Gestion Budget"),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.add_circle))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100.00); //kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
