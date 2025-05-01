import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';

class SearchMainBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final VoidCallback onClearSearch;

  const SearchMainBar({
    super.key,
    required this.onSearchChanged,
    required this.onClearSearch,
  });

  @override
  State<SearchMainBar> createState() => _SearchMainBarState();
}

class _SearchMainBarState extends State<SearchMainBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    widget.onClearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        widget.onSearchChanged(value);
      },
      style: TextStyle(color: AppColors.kTextColor, fontSize: 14.sp),
      cursorColor: AppColors.kTextColor,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 18,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide.none,
        ),

        hintStyle: TextStyle(color: AppColors.kTextColor, fontSize: 14.sp),
        hintText: 'Search products...',
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 8.r),
          child: SvgPicture.asset(
            'assets/icons/search.svg',
            colorFilter: const ColorFilter.mode(
              AppColors.kTextColor,
              BlendMode.srcIn,
            ),
          ),
        ),
        prefixIconColor: AppColors.kTextColor,
        prefixIconConstraints: BoxConstraints(
          minWidth: 45.r,
          minHeight: 20.r,
          maxHeight: 20.r,
          maxWidth: 45.r,
        ),

        fillColor: Colors.white,
        filled: true,

        suffixIcon:
            _searchController.text.isNotEmpty
                ? IconButton(
                  padding: EdgeInsets.only(right: 14.r),

                  icon: Icon(
                    size: 20.r,

                    Icons.clear,
                    color: AppColors.kTextColor,
                  ),
                  onPressed: _clearSearch,
                )
                : null,
      ),
    );
  }
}
