import 'package:flutter/material.dart';

import 'item_model.dart';

class ItemWidget extends StatelessWidget {
  final Results item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            child: Image.network(
              item.icon,
              fit: BoxFit.cover,
              height: 100,
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: Text(
                        item.rating.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4.0),
                Text(
                  item.types.join(', '),
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[700]),
                ),
                SizedBox(height: 4.0),
                Text(
                  '₹ ${150} per person | 54 min',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[500]),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Closes in 25min',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.orange),
                ),
                SizedBox(height: 4.0),
                Text(
                  'Promoted',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey[500]),
                ),
                SizedBox(height: 6.0),
                Text(
                  'Well sanitized kitchen *  Daily temperature checks * Rider hand wash',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.lightBlueAccent),
                ),
              ],
            )),
      ],
    );
  }
}
