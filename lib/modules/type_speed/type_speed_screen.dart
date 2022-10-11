import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_drawer.dart';

class TypeSpeedScreen extends StatelessWidget {
  const TypeSpeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Type Speed'),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Text("Text"),
        ],
      ),
    );
  }
}
