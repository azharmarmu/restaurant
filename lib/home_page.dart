import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/item_cubit.dart';
import 'item_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: ItemCubit()..get(),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SearchText(),
              Expanded(child: ItemListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}

class SearchText extends StatelessWidget {
  const SearchText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (val) => val.length > 2
          ? BlocProvider.of<ItemCubit>(context).get(keyword: val)
          : null,
      decoration: InputDecoration(
        hintText: 'Search for restaurant, cuisines',
        prefixIcon: Icon(Icons.search),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2.0,
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}

class ItemListWidget extends StatelessWidget {
  const ItemListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemCubit, ItemState>(
      bloc: BlocProvider.of<ItemCubit>(context),
      builder: (_, state) {
        print('state: $state');
        if (state is ItemLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ItemLoaded) {
          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemBuilder: (_, index) => ItemWidget(
              item: state.item.results[0],
            ),
            separatorBuilder: (_, index) => const SizedBox(
              height: 24,
            ),
            itemCount: state.item.results.length,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
