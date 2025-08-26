part of '../route.dart';

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.error});
  final Exception error;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    return Scaffold(
      appBar: AppBarWidget(
        isBarebone: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error.toString(),
              style: titleLarge?.copyWith(color: Colors.red),
            ),
            TextButton.icon(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                } else {
                  HomeRoute().go(context);
                }
              },
              label: Text("Back"),
              icon: Icon(Icons.arrow_back),
            ),
          ],
        ),
      ),
    );
  }
}
