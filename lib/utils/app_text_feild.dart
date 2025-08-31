import 'package:flutter/material.dart';
import 'package:air_conditioner_ui/utils/app_colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final VoidCallback? toggleObscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? suffixChild;
  final Widget? prefixChild;
  final void Function(String)? onChanged;
  final bool readOnly;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.toggleObscureText,
    this.keyboardType,
    this.validator,
    this.suffixChild,
    this.prefixChild,
    this.onChanged,
    this.readOnly = false,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  String? _displayedErrorText;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      widget.controller!.addListener(_onControllerChanged);
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    if (_displayedErrorText != null &&
        (widget.controller?.text.isNotEmpty ?? false)) {
      setState(() {
        _displayedErrorText = null;
      });
    }
    widget.onChanged?.call(widget.controller?.text ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.obscureText,
            obscuringCharacter: '*',
            keyboardType: widget.keyboardType ?? TextInputType.text,
            readOnly: widget.readOnly,
            cursorColor: AppColors.primaryColor,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppColors.whiteColor,
            ),
            onChanged: (value) {
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            validator: (value) {
              final errorFromValidator = widget.validator?.call(value);
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted) {
                  setState(() {
                    _displayedErrorText = errorFromValidator;
                  });
                }
              });
              return errorFromValidator;
            },
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: AppColors.primaryColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(30),
              ),

              // The icon and its sizing
              prefixIcon: widget.prefixChild,

              // The hint text and styling
              hintText: widget.hintText,
              hintStyle: TextStyle(
                color: Colors.grey.shade400,
                fontWeight: FontWeight.w500,
              ),

              // The suffix icon
              suffixIcon: widget.toggleObscureText != null
                  ? IconButton(
                      icon: Icon(
                        widget.obscureText
                            ? Icons.visibility_off_rounded
                            : Icons.visibility_rounded,
                        color: AppColors.primaryColor,
                        size: 18,
                      ),
                      onPressed: widget.toggleObscureText,
                    )
                  : widget.suffixChild,
            ),
          ),
        ),
        if (_displayedErrorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 2, left: 8),
            child: Text(
              _displayedErrorText!,
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primaryColor,
              ),
            ),
          ),
      ],
    );
  }
}
