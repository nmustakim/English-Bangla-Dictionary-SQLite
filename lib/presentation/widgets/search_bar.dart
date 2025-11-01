
import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class SearchBarWidget extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged;
  final VoidCallback onClear;

  const SearchBarWidget({
    super.key,
    required this.hintText,
    required this.onChanged,
    required this.onClear,
  });

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: widget.hintText,
          prefixIcon: const Icon(Icons.search, color: AppTheme.primaryColor),
          suffixIcon: _controller.text.isNotEmpty
              ? IconButton(
            icon: const Icon(Icons.clear, color: AppTheme.textSecondary),
            onPressed: () {
              _controller.clear();
              widget.onClear();
              setState(() {});
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        ),
        onTap: () => setState(() {}),
        onEditingComplete: () => setState(() {}),
      ),
    );
  }
}
