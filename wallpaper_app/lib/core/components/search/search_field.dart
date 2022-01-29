import 'package:flutter/material.dart';
import '../border/custom_border.dart';
import '../../extension/context_extension.dart';

class SearchField extends StatelessWidget {
  final Function()? iconOnTap;
  final Function(String value)? onChanged;
  final VoidCallback? onTap;
  final String? hintText;
  final TextEditingController? editingController;

  const SearchField(
      {Key? key,
      this.iconOnTap,
      this.onTap,
      this.onChanged,
      this.hintText,
      this.editingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: TextField(
        controller: editingController ?? TextEditingController(),
        onChanged: onChanged,
        onTap: onTap,
        decoration: InputDecoration(
            fillColor: context.theme.cardColor,
            filled: true,
            hoverColor: Colors.white,
            suffixIcon: IconButton(
                onPressed: iconOnTap, icon: const Icon(Icons.search_rounded)),
            hintText: hintText,
            focusedBorder: _outlineInputBorder(context),
            enabledBorder: _outlineInputBorder(context),
            border: _outlineInputBorder(context)),
      ),
    );
  }

  OutlineInputBorder _outlineInputBorder(BuildContext context) {
    return OutlineInputBorder(
      borderRadius: CustomBorderRadius.allCircular(),
      borderSide: BorderSide(color: context.theme.cardColor),
    );
  }
}
