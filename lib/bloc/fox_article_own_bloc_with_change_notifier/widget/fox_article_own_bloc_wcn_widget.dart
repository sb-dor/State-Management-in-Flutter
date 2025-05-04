import 'package:flutter/material.dart';
import 'package:state_management_course/bloc/fox_article_own_bloc_with_change_notifier/bloc/fox_article_own_bloc_with_change_notifier.dart';
import 'package:state_management_course/bloc/fox_article_own_bloc_with_change_notifier/data/fox_article_own_bloc_with_change_notifier.dart';

class FoxArticleOwnBlocWcnWidget extends StatefulWidget {
  const FoxArticleOwnBlocWcnWidget({super.key});

  @override
  State<FoxArticleOwnBlocWcnWidget> createState() => _FoxArticleOwnBlocWcnWidgetState();
}

class _FoxArticleOwnBlocWcnWidgetState extends State<FoxArticleOwnBlocWcnWidget> {
  late final FoxArticleOwnBlocWithChangeNotifier _bloc;

  @override
  void initState() {
    super.initState();

    _bloc = FoxArticleOwnBlocWithChangeNotifier(FoxArticleOwnBlocWithChangeNotifierImpl());

    _bloc.addListener(_listener);
  }

  void _listener() {
    setState(() {});
  }

  @override
  void dispose() {
    _bloc.removeListener(_listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Test bloc with change notifier")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {
              _bloc.fetch(id: _bloc.state.data?.id ?? 1);
            },
            child: Text("${_bloc.state.data?.id}"),
          ),
        ],
      ),
    );
  }
}
