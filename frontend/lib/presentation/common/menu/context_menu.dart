import 'package:dafluta/dafluta.dart';
import 'package:flutter/material.dart';
import 'package:testflow/presentation/common/button/secondary_icon_button.dart';
import 'package:testflow/presentation/common/text/body_medium.dart';
import 'package:testflow/utils/palette.dart';

class ContextMenu extends StatelessWidget {
  final ContextButton type;
  final List<MenuItemButton> children;
  final IconData icon;
  final Offset? offset;

  const ContextMenu({
    required this.type,
    required this.children,
    required this.icon,
    this.offset,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      alignmentOffset: offset,
      style: MenuStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(Palette.backgroundEmpty),
        padding: WidgetStateProperty.all(const EdgeInsets.all(0)),
        side: WidgetStateProperty.all(
          const BorderSide(color: Palette.borderInputEnabled, width: 1),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        ),
      ),
      clipBehavior: Clip.none,
      menuChildren: children,
      builder: (context, controller, child) {
        if (type == ContextButton.secondary) {
          return CustomWidgetButton(controller: controller, icon: icon);
        } else {
          return DefaultContextualButton(controller: controller, icon: icon);
        }
      },
    );
  }
}

class CustomWidgetButton extends StatelessWidget {
  final MenuController controller;
  final IconData icon;

  const CustomWidgetButton({required this.controller, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SecondaryIconButton(
      icon: icon,
      onPressed: () {
        if (controller.isOpen) {
          controller.close();
        } else {
          controller.open();
        }
      },
    );
  }
}

class DefaultContextualButton extends StatelessWidget {
  final MenuController controller;
  final IconData icon;

  const DefaultContextualButton({required this.controller, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.all(0),
      iconSize: 22,
      color: Palette.iconContextual,
      icon: Icon(icon),
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      onPressed: () {
        if (controller.isOpen) {
          controller.close();
        } else {
          controller.open();
        }
      },
    );
  }
}

class ContextMenuItem extends MenuItemButton {
  final String text;
  final Color color;
  final IconData? icon;
  final double? iconSize;

  ContextMenuItem({
    required this.text,
    required this.color,
    required super.onPressed,
    this.icon,
    this.iconSize,
  }) : super(
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisSize: MainAxisSize.min,
           children: [
             if (icon != null)
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 4),
                 child: Icon(icon, size: iconSize ?? 18, color: color),
               ),
             const HBox(4),
             BodyMedium(text: text, color: color),
             const HBox(8),
           ],
         ),
       );
}

enum ContextButton { secondary, iconButton }
