abstract interface class IPostDatasource {
  Future<void> savePost();

  Future<void> addText();
}

class PostDatasourceImpl implements IPostDatasource {
  @override
  Future<void> savePost() async {
    //
  }

  @override
  Future<void> addText() {
    // TODO: implement addText
    throw UnimplementedError();
  }
}
