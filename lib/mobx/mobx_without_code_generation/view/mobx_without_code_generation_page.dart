import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:state_management_course/mobx/mobx_without_code_generation/store/mobx_without_code_generation_store.dart';

class MobxWithoutCodeGenerationPage extends StatefulWidget {
  const MobxWithoutCodeGenerationPage({super.key});

  @override
  State<MobxWithoutCodeGenerationPage> createState() =>
      _MobxWithoutCodeGenerationPageState();
}

class _MobxWithoutCodeGenerationPageState
    extends State<MobxWithoutCodeGenerationPage> {
  late final TextEditingController _textEditingController;
  final mobxWithoutCodeGeneration = ModelWithoutCodeGenerationStore();

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mobx without code generation")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final value = _textEditingController.text.trim();
          if (value.isEmpty) return;
          mobxWithoutCodeGeneration.addToList(value);
          _textEditingController.clear();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(hintText: "Add name"),
          ),
          Observer(
            builder:
                (_) => ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 10),
                  itemCount: mobxWithoutCodeGeneration.list.length,
                  itemBuilder: (context, index) {
                    final model = mobxWithoutCodeGeneration.list[index];
                    return ListTile(
                      title: Text(model.desc),
                      trailing: IconButton(
                        onPressed: () {
                          mobxWithoutCodeGeneration.delete(model);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}
