import 'package:flutter/material.dart';

import '../models/models.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.currentUser});

  final User currentUser;
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
        ),
        padding: const EdgeInsets.fromLTRB(31, 12, 12, 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.search),
           const  SizedBox(width: 23.5,),
           Expanded(child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
            ),
           ))
          ],
        ),
      ),

    );
  }
}