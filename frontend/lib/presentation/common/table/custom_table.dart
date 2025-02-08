import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:testflow/domain/model/custom_table_cell.dart';
import 'package:testflow/utils/palette.dart';

class CustomTable<T extends CustomTableCell> extends StatelessWidget {
  final List<String> columns;
  final List<T> rows;
  final Function(T) onRowSelected;

  const CustomTable({
    required this.columns,
    required this.rows,
    required this.onRowSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      columnCount: columns.length,
      rowCount: rows.length,
      header: (context, index) => ShadTableCell.header(
        child: Text(
          columns[index],
          style: const TextStyle(
            color: Palette.textEnabled,
          ),
        ),
      ),
      columnSpanExtent: (index) => FractionalSpanExtent(1 / columns.length),
      onRowTap: (index) => onRowSelected(rows[index]),
      rowSpanBackgroundDecoration: (row) => row == 0
          ? const SpanDecoration(
              color: Palette.backgroundTableHeader,
            )
          : null,
      builder: (context, index) => ShadTableCell(
        child: Text(rows[index.row].cell(index.column)),
      ),
    );
  }
}
