import 'package:base_todolist/config/locator.dart';
import 'package:base_todolist/config/shared_preference.dart';
import 'package:base_todolist/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../ui/dimen.dart';


class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        controllerColor: Theme.of(context).colorScheme.primary,
        headerBackgroundColor: Theme.of(context).colorScheme.background,
        finishButtonText: 'Start',
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: Theme.of(context).colorScheme.primary,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXl))
        ),
        onFinish: (){
          final CacheStore cacheStore = locator.get();
          cacheStore.setFirst(false);
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
        },
        skipTextButton: Text('Skip'),
        background: [
          Container(),
          Container(),
          Container(),

        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: paddingLarge),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/img_onboarding1.jpg',height: 300,width: 300,),

                SizedBox(
                  height: spacing5,
                ),
                Text("Welcome to Todo List!",style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
                SizedBox(height: spacing5,),
                Text("Thank you for choosing Todo List to supercharge your productivity! Let's get started on your journey to a more organized and efficient life. Follow our quick onboarding process to set up your personalized to-do list and unlock a world of productivity.",textAlign: TextAlign.center,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal:paddingLarge),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/img_onboarding2.jpg',height: 300,width: 300,),

                SizedBox(
                  height: spacing5,
                ),
                Text("Customize Your Tasks with Todo List!",style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
                SizedBox(height: spacing5,),
                Text("Personalize your to-do list experience with Todo List! From prioritizing tasks to setting due dates, we've got you covered. Start by creating your first task and explore the powerful features that will help you stay organized and focused on what matters most.",textAlign: TextAlign.center,),
              ],
            ),
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: paddingLarge),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/img_onboarding3.jpg',height: 300,width: 300,),

                SizedBox(
                  height: spacing5,
                ),
                Text("Stay Productive Anywhere, Anytime!",style: Theme.of(context).textTheme.displayMedium,textAlign: TextAlign.center,),
                SizedBox(height: spacing5,),
                Text("With Todo List, your to-do list is always at your fingertips. Whether you're at home, work, or on the go, stay connected and organized. Begin your journey by adding tasks, setting reminders, and exploring our intuitive features. Boost your productivity and make every day a success!",textAlign: TextAlign.center,),
                ],
            ),
          ),
        ],
      ),
    );
  }
}
