import 'package:flutter/material.dart';

class ActionsRowWidget extends StatelessWidget {
  const ActionsRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // final colorScheme = Theme.of(context).colorScheme;
    // final authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    // final noticeNotifier = Provider.of<NoticeNotifier>(context, listen: false);
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.end,
    //     children: [
    //       if (noticeNotifier.notice != null)
    //         Padding(
    //           padding: EdgeInsets.only(right: 10),
    //           child: FutureBuilder(
    //             future: list(
    //               NoticeStaff.classType,
    //               where: NoticeStaff.STAFF
    //                   .eq(authNotifier.user.id)
    //                   .and(NoticeStaff.NOTICE.eq(noticeNotifier.notice!.id)),
    //             ),
    //             builder: (context, snapshot) {
    //               if (snapshot.connectionState == ConnectionState.waiting) {
    //                 return const Center(
    //                   child: CircularProgressIndicator.adaptive(),
    //                 );
    //               } else if (snapshot.hasError) {
    //                 return Text('Error: ${snapshot.error}');
    //               } else {
    //                 final unreadList = snapshot.data!
    //                     .where((element) => element.readAt == null)
    //                     .toList();
    //                 if (unreadList.isEmpty) {
    //                   return ElevatedButton.icon(
    //                     onPressed: () {},
    //                     label: const Text('You\'ve read this notice'),
    //                     icon: Icon(Icons.mark_email_read_outlined),
    //                   );
    //                 } else {
    //                   return ElevatedButton.icon(
    //                     onPressed: () async {
    //                       await Future.wait(unreadList.map(
    //                         (e) => update(
    //                             e.copyWith(readAt: TemporalDateTime.now())),
    //                       ));
    //                       if (!context.mounted) return;
    //                       context.go(SMSWidget.path);
    //                     },
    //                     label: const Text('Mark as read'),
    //                     icon: Icon(Icons.mark_email_unread_outlined),
    //                   );
    //                 }
    //               }
    //             },
    //           ),
    //         ),
    //     ],
    //   ),
    // );
  }
}
