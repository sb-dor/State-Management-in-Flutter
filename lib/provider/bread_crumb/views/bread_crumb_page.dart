import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/provider/bread_crumb/models/bread_crumb.dart';
import 'package:state_management_course/provider/bread_crumb/provider/bread_crumb_provider.dart';
import 'package:state_management_course/provider/bread_crumb/views/bread_crumb_widget.dart';

import 'bread_crumb_create_screen.dart';

class BreadCrumbPage extends StatefulWidget {
  const BreadCrumbPage({super.key});

  @override
  State<BreadCrumbPage> createState() => _BreadCrumbPageState();
}

class _BreadCrumbPageState extends State<BreadCrumbPage> {
  @override
  Widget build(BuildContext context) {
    // the way how to listen only specific item of provider
    // final list = context.select<BreadCrumbProvider, List<BreadCrumb>>(
    //   (provider) => provider.items,
    // );

    // a lot of programmers with a lot of experience say that if you are out side of build function
    // use the Provider.of itself instead of using context.watch in order to watch something

    // but if you are inside of build function you can use that

    return Scaffold(
      appBar: AppBar(title: const Text("BreadCrump page")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer<BreadCrumbProvider>(
              builder: (context, value, child) {
                return BreadCrumbWidget(breadCrumbs: value.items);
              },
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BreadCrumbCreateScreen(),
                  ),
                );
              },
              child: const Text("Add new bread crumb"),
            ),
            TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
