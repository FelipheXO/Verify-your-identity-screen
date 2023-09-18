part of '../verify.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: CustomButton(
          onPress: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const FaceVerificationScreen(),
              ),
            );
          },
          title: 'Lets verify'),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_pin, color: AppColors.secundary, size: 80),
            const SizedBox(height: 20),
            Text('Verify your identity',
                style: Theme.of(context).textTheme.bodyText1),
            const SizedBox(height: 10),
            Text("We've sent a password recover\ninstructions to your email",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}
