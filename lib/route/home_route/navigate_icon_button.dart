part of 'home_widget.dart';

class NavigateIconButton extends StatelessWidget {
  const NavigateIconButton({
    super.key,
    required this.icon,
    required this.name,
    this.onPressed,
  });
  final IconData icon;
  final String name;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            size: 50,
          ),
          Text(
            name,
            // style: TextStyle(fontSize: 8),
          ),
        ],
      ),
    );
  }
}
