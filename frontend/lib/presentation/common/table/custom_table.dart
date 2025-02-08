import 'package:flutter/widgets.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:testflow/domain/model/custom_table_cell.dart';
import 'package:testflow/utils/palette.dart';

class CustomTable<T extends CustomTableCell> extends StatelessWidget {
  final List<String> columns;
  final List<T> rows;

  const CustomTable({
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return ShadTable(
      columnCount: columns.length,
      rowCount: rows.length,
      header: (context, index) => ShadTableCell.header(
        child: Text(columns[index],
            style: const TextStyle(
              color: Palette.textEnabled,
            )),
      ),
      columnSpanExtent: (index) => const FractionalSpanExtent(0.25),
      onRowTap: (index) => print(rows[index]),
      rowSpanBackgroundDecoration: (row) => row == 0
          ? const SpanDecoration(
              color: Palette.backgroundTableHeader,
            )
          : null,
      builder: (context, index) {
        final T element = rows[index.row];
        return ShadTableCell(
          alignment: Alignment.centerLeft,
          child: Text(
            element.cell(index.column),
            style: index.column == 0
                ? const TextStyle(fontWeight: FontWeight.w500)
                : null,
          ),
        );
      },
    );
  }
}
