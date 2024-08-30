import 'dart:convert';

import 'package:adsats_amplify_gen_2/auth/auth_notifier.dart';
import 'package:adsats_amplify_gen_2/helper/data_table_2.dart';
import 'package:adsats_amplify_gen_2/helper/multi_select.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:data_table_2/data_table_2.dart';

part 'documents_data_source.dart';
part 'documents_filter.dart';
part 'search_bar_widget.dart';
part 'date_range_picker.dart';
part 's3.dart';

class DocumentsWidget extends StatelessWidget {
  const DocumentsWidget({super.key,});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 1536.0),
        child: MyDataTable2(DocumentsDataSource(context)),
      ),
    );
  }
}
