import 'package:flutter/material.dart';

class AppDismissibleWidget extends StatelessWidget {
  const AppDismissibleWidget({
    super.key,
    required this.valueKey,
    required this.child,
    required this.confirmDismiss, required this.onDelete, required this.onUpdate,
  });

  final String valueKey;
  final Widget child;
  final Future confirmDismiss;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(valueKey),
      background: Material(
        elevation: 1.2,
        child: Container(
          color: Colors.tealAccent,
        ),
      ),
      secondaryBackground: Material(
        elevation: 1.2,
        child: Container(
          color: Colors.yellowAccent,
        ),
      ),
      onDismissed: (direction) {
        if(direction == DismissDirection.startToEnd) onUpdate;
        if(direction == DismissDirection.endToStart) onDelete;
      },
      confirmDismiss: (direction)  async{
        bool dismiss = false;
        if(direction == DismissDirection.endToStart) confirmDismiss;
        return dismiss;
      },
      child: child,
    );
  }
}
