import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:state_management_course/mobx/mobx_with_streams/store/mobx_with_streams_store.dart';

class MobxWithStreamPage extends StatefulWidget {
  const MobxWithStreamPage({super.key});

  @override
  State<MobxWithStreamPage> createState() => _MobxWithStreamPageState();
}

class _MobxWithStreamPageState extends State<MobxWithStreamPage> {
  @override
  Widget build(BuildContext context) {
    final mobxWithStreamPage = Provider.of<MobxWithStreamsData>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobx streams"),
      ),
      body: Observer(
        builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Text("${mobxWithStreamPage.integerChangerStream.value}"),
                TextButton(
                  onPressed: () {
                    mobxWithStreamPage.startCount();
                  },
                  child: const Text("Start"),
                ), TextButton(
                  onPressed: () {
                    mobxWithStreamPage.stopCount();
                  },
                  child: const Text("Stop"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
