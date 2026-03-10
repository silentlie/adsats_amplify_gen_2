import 'package:adsats_amplify_gen_2/auth/auth.dart';
import 'package:adsats_amplify_gen_2/helper/extensions/iterable_join_string_extension.dart';
import 'package:adsats_amplify_gen_2/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileHomePage extends ConsumerWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userDetails =
        ref.watch(userDetailsProvider.select((value) => value.value));
    if (userDetails == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1536),
        child: Card(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    'Profile',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                ListTile(
                  title: const Text('User ID'),
                  subtitle: Text(userDetails.id),
                ),
                ListTile(
                  title: const Text('First Name'),
                  subtitle: Text(userDetails.firstName),
                ),
                ListTile(
                  title: const Text('Last Name'),
                  subtitle: Text(userDetails.lastName),
                ),
                ListTile(
                  title: const Text('Email'),
                  subtitle: Text(userDetails.email),
                ),
                ListTile(
                  title: const Text('Aircraft'),
                  subtitle:
                      Text(userDetails.aircraft?.joinAircraftNames() ?? 'Nil'),
                ),
                for (final subcategory
                    in userDetails.subcategories ?? <StaffSubcategory>[])
                  ListTile(
                    title: Text('Folder ${subcategory.subcategory!.name}'),
                    subtitle: Text(accessLevel(subcategory.accessLevel)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String accessLevel(int? level) {
    switch (level) {
      case 0:
        return 'No Access';
      case 1:
        return 'Read Only';
      case 2:
        return 'Read and Write';
      default:
        return 'Unknown';
    }
  }
}
