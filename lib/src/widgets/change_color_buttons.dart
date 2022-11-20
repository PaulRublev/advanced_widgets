import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme_provider.dart';
import '../themes.dart';

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

class ColorPaletteButton extends StatelessWidget {
  const ColorPaletteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Themes>(
      position: PopupMenuPosition.over,
      enableFeedback: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Theme.of(context).canvasColor,
      onSelected: (Themes item) {
        Provider.of<ThemeProvider>(
          context,
          listen: false,
        ).switchTheme(
          theme: item,
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Themes>>[
        for (final theme in Themes.values)
          PopupMenuItem<Themes>(
            value: theme,
            child: Icon(
              Icons.format_paint_outlined,
              size: 40,
              color: CustomThemesData.getThemeData(theme).primaryColor,
            ),
          ),
      ],
    );
  }
}
