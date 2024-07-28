import 'package:flutter/foundation.dart';

@immutable
abstract class ItemAction {
  final String item;

  const ItemAction(this.item);
}

@immutable
class AddItemAction extends ItemAction {
  const AddItemAction(super.item);
}

@immutable
class RemoveItemAction extends ItemAction {
  const RemoveItemAction(super.item);
}
