import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../api_client.dart';
import '../item_model.dart';

part 'item_state.dart';

class ItemCubit extends Cubit<ItemState> {
  ItemCubit() : super(ItemLoading());

  Future<void> get({String? keyword}) async {
    emit(ItemLoading());
    // try {
    final response = await ApiClient().get(keyword: keyword);
    if (response.statusCode == 200) {
      emit(ItemLoaded(ItemModel.fromJson(response.data)));
    } else {
      emit(ItemError());
    }
    // } catch (e) {
    //   print('catch: ${e.toString()}');
    //   emit(ItemError());
    // }
  }
}
