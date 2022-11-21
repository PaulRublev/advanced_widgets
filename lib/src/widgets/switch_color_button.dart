import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';

class SwitchColorButton extends StatelessWidget {
  const SwitchColorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (() {
        Provider.of<ThemeProvider>(
          context,
          listen: false,
        ).switchTheme();
      }),
      icon: const Icon(Icons.color_lens_outlined),
    );
  }
}
