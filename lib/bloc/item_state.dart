part of 'item_cubit.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemLoading extends ItemState {}

class ItemLoaded extends ItemState {
  final ItemModel item;

  const ItemLoaded(this.item);

  @override
  List<Object> get props => [item];
}

class ItemError extends ItemState {}
