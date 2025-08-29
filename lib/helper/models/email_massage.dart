class EmailMessage {
  final String subject;
  // only the <main>…</main> block
  final String htmlMain;
  final String sender;
  EmailMessage(
      {required this.subject, required this.htmlMain, required this.sender});
}
