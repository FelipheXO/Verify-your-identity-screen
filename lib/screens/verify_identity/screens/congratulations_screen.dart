part of '../verify.dart';

class CongratulationsScreen extends StatelessWidget {
  const CongratulationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.beenhere, color: AppColors.secundary, size: 80),
            const SizedBox(height: 20),
            Text('Congratulations',
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 10),
            Text(
                "Your identity has been verified. Now you\ncan setup your new password.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}
