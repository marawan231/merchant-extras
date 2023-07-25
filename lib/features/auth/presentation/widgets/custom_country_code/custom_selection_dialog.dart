import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_country_code.dart';

/// selection dialog used for selection of the country code
class CustomSelectionDialog extends StatefulWidget {
  final List<CustomCountryCode> elements;
  final bool? showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle? searchStyle;
  final TextStyle? textStyle;
  final BoxDecoration? boxDecoration;
  final WidgetBuilder? emptySearchBuilder;
  final bool? showFlag;
  final double flagWidth;
  final Decoration? flagDecoration;
  final Size? size;
  final bool hideSearch;
  final Icon? closeIcon;

  /// Background color of CustomSelectionDialog
  final Color? backgroundColor;

  /// Boxshaow color of CustomSelectionDialog that matches CountryCodePicker barrier color
  final Color? barrierColor;

  /// elements passed as favorite
  final List<CustomCountryCode> favoriteElements;

  CustomSelectionDialog(
    this.elements,
    this.favoriteElements, {
    Key? key,
    this.showCountryOnly,
    this.emptySearchBuilder,
    InputDecoration searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.textStyle,
    this.boxDecoration,
    this.showFlag,
    this.flagDecoration,
    this.flagWidth = 32,
    this.size,
    this.backgroundColor,
    this.barrierColor,
    this.hideSearch = false,
    this.closeIcon,
  })  : searchDecoration = searchDecoration.prefixIcon == null
            ? searchDecoration.copyWith(prefixIcon: const Icon(Icons.search))
            : searchDecoration,
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<CustomSelectionDialog> {
  /// this is useful for filtering purpose
  late List<CustomCountryCode> filteredElements;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: widget.size?.width ?? MediaQuery.of(context).size.width,
          height:
              widget.size?.height ?? MediaQuery.of(context).size.height * 0.85,
          decoration: widget.boxDecoration ??
              BoxDecoration(
                color: widget.backgroundColor ?? Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: widget.barrierColor ?? Colors.grey.withOpacity(1),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                padding: const EdgeInsets.all(0),
                iconSize: 20,
                icon: widget.closeIcon!,
                onPressed: () => Navigator.pop(context),
              ),
              if (!widget.hideSearch)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: TextField(
                    style: widget.searchStyle,
                    decoration: widget.searchDecoration,
                    onChanged: _filterElements,
                  ),
                ),
              Expanded(
                child: ListView(
                  children: [
                    widget.favoriteElements.isEmpty
                        ? const DecoratedBox(decoration: BoxDecoration())
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...widget.favoriteElements.map(
                                (f) => SimpleDialogOption(
                                  child: _buildOption(f),
                                  onPressed: () {
                                    _selectItem(f);
                                  },
                                ),
                              ),
                              const Divider(),
                            ],
                          ),
                    if (filteredElements.isEmpty)
                      _buildEmptySearchWidget(context)
                    else
                      ...filteredElements.map(
                        (e) => SimpleDialogOption(
                          child: _buildOption(e),
                          onPressed: () {
                            _selectItem(e);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildOption(CustomCountryCode e) {
    return SizedBox(
        width: 400,
        child: Flex(direction: Axis.horizontal, children: <Widget>[
          if (widget.showFlag!)
            Flexible(
                child: Container(
                    decoration: widget.flagDecoration,
                    clipBehavior: widget.flagDecoration == null
                        ? Clip.none
                        : Clip.hardEdge,
                    child: Image.asset(
                      e.flagUri!,
                      package: 'country_code_picker',
                      width: widget.flagWidth,
                    ))),
          SizedBox(width: 8.w),
          Expanded(
              flex: 4,
              child: Row(children: [
                Text(e.dialCode.toString(),
                    textDirection: TextDirection.ltr,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.fade,
                    style: widget.textStyle),
                SizedBox(width: 2.w),
                Flexible(
                    child: Text(e.cleanName!,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        maxLines: 1,
                        overflow: TextOverflow.fade,
                        style: widget.textStyle))
              ]))
        ]));
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder!(context);
    }

    return Center(
      child: Text(CountryLocalizations.of(context)?.translate('no_country') ??
          'No country found'),
    );
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
              e.code!.contains(s) ||
              e.dialCode!.contains(s) ||
              e.name!.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CustomCountryCode e) {
    Navigator.pop(context, e);
  }
}
