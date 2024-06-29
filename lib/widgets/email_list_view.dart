import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../modals/models.dart';



class EmailListView extends StatelessWidget {
  const EmailListView({
    super.key, this.selectedIndex, 
    required this.onSelected, 
    required this.currentUser
    });

final int? selectedIndex;
final ValueChanged<int> onSelected;
final User currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8,),
          Text('search'),
          const SizedBox(height: 8,)
        ],
      ),
    );
  }
}