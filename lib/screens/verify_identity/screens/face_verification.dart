// ignore_for_file: use_build_context_synchronously

part of '../verify.dart';

class FaceVerificationScreen extends StatefulWidget {
  const FaceVerificationScreen({super.key});

  @override
  State<FaceVerificationScreen> createState() => _FaceVerificationScreenState();
}

class _FaceVerificationScreenState extends State<FaceVerificationScreen> {
  late CameraController _cameraController;
  bool isDetecting = false;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    _cameraController = CameraController(cameras[1], ResolutionPreset.max);
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
      _startVerification();
    });
  }

  double _progressValue = 0.0;

  Color color = Colors.red;
  bool showColor = false;

  void _startVerification() async {
    Future.delayed(const Duration(milliseconds: 100), () async {
      showColor = !showColor;
      setState(() {});
    });
    Future.delayed(const Duration(milliseconds: 800), () async {
      setState(() {
        if (_progressValue < 1.0) {
          _progressValue += 0.08;
          if (_progressValue > 1.0) {
            _progressValue = 1;
          }
          if (_progressValue > 0.8) {
            color = Colors.green;
          }
          _startVerification();
        } else {
          Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(
              builder: (context) => const CongratulationsScreen(),
            ),
          );
        }
      });
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container();
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${(_progressValue * 100).toStringAsFixed(0)}% Recognition',
              style: const TextStyle(fontSize: 24, color: AppColors.text2)),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            width: MediaQuery.of(context).size.width * 0.80,
            height: 10,
            child: LinearProgressIndicator(
              value: _progressValue,
              backgroundColor: AppColors.text2,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(AppColors.secundary),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 270,
              height: 300,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(150.0),
                border: Border.all(
                  color: showColor ? color : Colors.transparent,
                  width: 5.0,
                ),
              ),
              child: ClipOval(
                child: CameraPreview(_cameraController),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
