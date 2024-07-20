import 'package:flutter/material.dart';

class Badge extends StatefulWidget{
  const Badge({required this.child, required this.value,  required this.color});
  final Widget child;
  final String value;
  final Color color;

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  bool isbadgeEnable=false;
  @override 
  Widget build(BuildContext context){
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        Positioned(
          right: 8.0,
          top: 8.0,
          child: Container(
            padding: EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: widget.color !=null? widget.color:Theme.of(context).accentColor,
            ),
            constraints: BoxConstraints(
              minHeight: 16,
              minWidth: 16
            ),
            child: Text(
              widget.value,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 10),
            ),
          )
        )
      ],
    );
  }
}
