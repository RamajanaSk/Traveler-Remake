import 'package:flutter/material.dart';
import 'package:travelerremake/core/widgets/bar/topbar/topNavBarDecoration.dart';

class TopNavBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  final IconData? trailingIcon1;
  final VoidCallback? trailingOnPressed1;

  final IconData? trailingIcon2;
  final VoidCallback? trailingOnPressed2;

  final Widget? trailingWidget1;
  final Widget? trailingWidget2;

  final Widget? leadingWidget;
  final bool showBottomLine;

  const TopNavBar({
    super.key,
    required this.title,
    this.trailingIcon1,
    this.trailingOnPressed1,
    this.trailingIcon2,
    this.trailingOnPressed2,
    this.trailingWidget1,
    this.trailingWidget2,
    this.leadingWidget,
    this.showBottomLine = true,
  });

  @override
  Size get preferredSize => Size.fromHeight(showBottomLine ? 60 : 56);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor: theme.colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      elevation: 0,

      title:
          leadingWidget ??
          Text(
            title,
            style: TopNavBarDecoration.getTitleTextStyle().copyWith(
              fontSize: 24,
              color: theme.colorScheme.onSurface,
            ),
          ),

      centerTitle: false,

      automaticallyImplyLeading: false,

      actions: [
        if (trailingIcon1 != null || trailingWidget1 != null)
          IconButton(
            icon: trailingIcon1 != null
                ? Icon(trailingIcon1, color: theme.colorScheme.onSurface)
                : trailingWidget1!,
            onPressed: trailingOnPressed1,
          ),

        if (trailingIcon2 != null || trailingWidget2 != null)
          IconButton(
            icon: trailingIcon2 != null
                ? Icon(trailingIcon2, color: theme.colorScheme.onSurface)
                : trailingWidget2!,
            onPressed: trailingOnPressed2,
          ),
      ],

      bottom: showBottomLine
          ? PreferredSize(
              preferredSize: const Size.fromHeight(4),
              child: Container(
                height: 4,
                width: double.infinity,
                decoration: TopNavBarDecoration.getBoxDecoration(),
              ),
            )
          : null,
    );
  }
}
