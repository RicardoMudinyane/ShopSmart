import 'package:flutter/material.dart';

class ShowMore extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  ShowMore({ this.text, @required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
//            style: Theme.of(context).textTheme.body1,
            style: TextStyle(
//                color: widget.color,
                fontSize: 17.0,
                fontWeight: FontWeight.bold
            ),

          ),
        ),
        FlatButton(
          child: Text('See all'),
          onPressed: onTap,
        )
      ],
    );
  }
}
