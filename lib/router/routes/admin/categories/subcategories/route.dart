part of '../../../route.dart';

class SubcategoriesRoute extends RouteInfo with _$SubcategoriesRoute {
  const SubcategoriesRoute({required this.categoryId});
  static const route = TypedGoRoute<SubcategoriesRoute>(
    path: ':categoryId',
    name: 'Subcategories',
  );
  final String categoryId;

  @override
  Icon get icon => const Icon(Icons.view_agenda_outlined);
  @override
  Icon get selectedIcon => const Icon(Icons.view_agenda);
  @override
  String get label => 'Subcategories';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return MaterialPage(
        child: SubcategoriesPage(
      categoryId: categoryId,
    ));
  }
}
