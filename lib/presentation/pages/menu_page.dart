import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

import '../../config/app_router.gr.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text("->"),
        onPressed: () {
          log(context.router.current.name, name: "Current route");
          context.router.push(CategoryRoute());
        },
      ),
    );
  }
}
