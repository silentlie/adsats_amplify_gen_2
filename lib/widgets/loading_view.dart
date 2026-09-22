import 'package:adsats_amplify_gen_2/widgets/app_bar_widget.dart';
import 'package:material_ui/material_ui.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    final isScaffold =
        context.findAncestorWidgetOfExactType<Scaffold>() != null;
    if (isScaffold) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBarWidget(
        isBarebone: true,
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
