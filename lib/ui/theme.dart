import 'package:flutter/material.dart';
import 'dimen.dart';
import 'type.dart';
import 'color.dart';

class AppTheme {
  // Settings Light Theme
   static ThemeData get light {
    return ThemeData(
      fontFamily: "Jakarta",
      useMaterial3: true,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: primaryColorLight,
          onPrimary: onPrimaryColorLight,
          primaryContainer: primaryContainerColorLight,
          onPrimaryContainer: onPrimaryContainerColorLight,
          secondary: secondaryColorLight,
          onSecondary: onSecondaryColorLight,
          secondaryContainer: secondaryContainerColorLight,
          onSecondaryContainer: onSecondaryContainerColorLight,
          error: errorColorLight,
          onError: onErrorColorLight,
          background: backgroundColorLight,
          onBackground: onBackgroundColorLight,
          surface: surfaceColorLight,
          onSurface: onSurfaceColorLight),
      textTheme: TextTheme(
        displayLarge : lBold.copyWith(color:textColorLight),
        displayMedium: mlBold.copyWith(color: textColorLight),
        displaySmall: mBold.copyWith(color: textColorLight),
        headlineLarge: lSemiBold.copyWith(color: textColorLight),
        headlineMedium: mlSemiBold.copyWith(color: textColorLight),
        headlineSmall: mSemiBold.copyWith(color: textColorLight),
        titleLarge: smMedium.copyWith(color: textColorLight),
        titleMedium: sMedium.copyWith(color: textColorLight),
        titleSmall: xsMedium.copyWith(color: textColorLight),
        bodyLarge: smRegular.copyWith(color: textColorLight),
        bodyMedium: sRegular.copyWith(color: textColorLight),
        bodySmall: xsRegular.copyWith(color: textColorLight),
        labelLarge: sRegular.copyWith(color: textColorLight),
        labelMedium: xsRegular.copyWith(color: textColorLight),
        labelSmall: xxsRegular.copyWith(color: textColorLight),
      ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        actionIconTheme: _actionIconThemeData,
        appBarTheme: _appBarThemeLight,
        inputDecorationTheme: _inputDecorationThemeLight,
        outlinedButtonTheme: _outlinedButtonThemeDataLight ,
        elevatedButtonTheme: _elevatedButtonThemeDataLight,
      scaffoldBackgroundColor: backgroundColorLight,
      textButtonTheme: _textButtonThemeData,
      iconButtonTheme: _iconButtonThemeData,
      chipTheme: _chipThemeData,
      bottomSheetTheme: _bottomSheetThemeDataLight,
      radioTheme: _radioThemeLight,
    );
  }

   static ThemeData get dark {
    return ThemeData(
        fontFamily: "Jakarta",
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.dark,
            primary: primaryColorDark,
            onPrimary: onPrimaryColorDark,
            primaryContainer: primaryContainerColorDark,
            onPrimaryContainer: onPrimaryContainerColorDark,
            secondary: secondaryColorDark,
            onSecondary: onSecondaryColorDark,
            secondaryContainer: secondaryContainerColorDark,
            onSecondaryContainer: onSecondaryContainerColorDark,
            error: errorColorDark,
            onError: onErrorColorDark,
            background: backgroundColorDark,
            onBackground: onBackgroundColorDark,
            surface: surfaceColorDark,
            onSurface: onSurfaceColorDark),
        textTheme: TextTheme(
          displayLarge : lBold.copyWith(color: textColorDark),
          displayMedium: mlBold.copyWith(color: textColorDark),
          displaySmall: mBold.copyWith(color: textColorDark),
          headlineLarge: lSemiBold.copyWith(color: textColorDark),
          headlineMedium: mlSemiBold.copyWith(color: textColorDark),
          headlineSmall: mSemiBold.copyWith(color: textColorDark),
          titleLarge: smMedium.copyWith(color: textColorDark),
          titleMedium: sMedium.copyWith(color: textColorDark),
          titleSmall: xsMedium.copyWith(color: textColorDark),
          bodyLarge: smRegular.copyWith(color: textColorDark),
          bodyMedium: sRegular.copyWith(color: textColorDark),
          bodySmall: xsRegular.copyWith(color: textColorDark),
          labelLarge: sRegular.copyWith(color: textColorDark),
          labelMedium: xsRegular.copyWith(color: textColorDark),
          labelSmall: xxsRegular.copyWith(color: textColorDark),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        actionIconTheme: _actionIconThemeData,
        appBarTheme: _appBarThemeDark,
        inputDecorationTheme: _inputDecorationThemeDark,
        outlinedButtonTheme: _outlinedButtonThemeDataDark ,
        elevatedButtonTheme: _elevatedButtonThemeDataDark,
      scaffoldBackgroundColor: backgroundColorDark,
      textButtonTheme: _textButtonThemeData,
      iconButtonTheme: _iconButtonThemeData,
      chipTheme: _chipThemeData,
      bottomSheetTheme: _bottomSheetThemeDataDark,
      radioTheme: _radioThemeDark
    );
  }

   static final ActionIconThemeData _actionIconThemeData = ActionIconThemeData(
     // backButtonIconBuilder: (BuildContext context) => IconButton(
     //   onPressed: () => Navigator.maybePop(context),
     //   icon: SvgPicture.asset('assets/images/ic_back.svg',width: 12,height: 12,),
     // ),
   );

   static const AppBarTheme _appBarThemeLight = AppBarTheme(
       iconTheme: IconThemeData(
         color: textColorLight, //change your color here
       ),
       backgroundColor: backgroundColorLight,
       elevation: 0,
       titleTextStyle: smBold,
       centerTitle: false,
       scrolledUnderElevation: 0
   );

   static const AppBarTheme _appBarThemeDark = AppBarTheme(
       iconTheme: IconThemeData(
         color: textColorDark, //change your color here
       ),
       backgroundColor: backgroundColorDark,
       elevation: 0,
       titleTextStyle: smBold,
       centerTitle: false,
       scrolledUnderElevation: 0
   );

   static const RadioThemeData _radioThemeLight = RadioThemeData(
     fillColor: MaterialStatePropertyAll<Color>(primaryColorLight),
   );

   static const RadioThemeData _radioThemeDark = RadioThemeData(
     fillColor: MaterialStatePropertyAll<Color>(primaryColorDark),
   );


   static final InputDecorationTheme _inputDecorationThemeLight = InputDecorationTheme(
     hintStyle: sRegular.copyWith(color: gray6Color),
     labelStyle: sRegular.copyWith(color: gray6Color) ,
     contentPadding: const EdgeInsets.symmetric(
       horizontal: spacing5,
        vertical: spacing5,
     ),
     enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: gray9Color,)
     ),
     focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: primaryColorLight)
     ),
     focusedErrorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: errorColorLight)
     ),
   );

   static final InputDecorationTheme _inputDecorationThemeDark = InputDecorationTheme(
     hintStyle: sRegular.copyWith(color: gray6Color),
     labelStyle: sRegular.copyWith(color: gray6Color) ,
     contentPadding: const EdgeInsets.symmetric(
       horizontal: spacing5,
       vertical: spacing5,
     ),
     enabledBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: gray9Color,)
     ),
     focusedBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: primaryColorDark)
     ),
     focusedErrorBorder: OutlineInputBorder(
         borderRadius: BorderRadius.circular(10),
         borderSide: BorderSide(color: errorColorDark)
     ),
   );

   static final OutlinedButtonThemeData _outlinedButtonThemeDataLight = OutlinedButtonThemeData(
       style: OutlinedButton.styleFrom(
           foregroundColor: gray1Color,
           padding: const EdgeInsets.symmetric(horizontal: spacing5,vertical: spacing5),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(radiusXxl)
           ),
           side: const BorderSide(
             color: primaryColorLight,
           )
       )
   );

   static final OutlinedButtonThemeData _outlinedButtonThemeDataDark = OutlinedButtonThemeData(
       style: OutlinedButton.styleFrom(
           foregroundColor: gray1Color,
           padding: const EdgeInsets.symmetric(horizontal: spacing5,vertical: spacing5),
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(radiusXxl)
           ),
           side: const BorderSide(
             color: primaryColorDark,
           )
       )
   );

   static final ElevatedButtonThemeData _elevatedButtonThemeDataLight =  ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         padding: const EdgeInsets.symmetric(horizontal: spacing5,vertical: spacing5),
         foregroundColor: onPrimaryColorLight,
         backgroundColor: primaryColorLight,
         disabledForegroundColor: gray6Color,
         disabledBackgroundColor: gray7Color,
         textStyle: smSemiBold,
       )
   );

   static final ElevatedButtonThemeData _elevatedButtonThemeDataDark =  ElevatedButtonThemeData(
       style: ElevatedButton.styleFrom(
         padding: const EdgeInsets.symmetric(horizontal: spacing5,vertical: spacing5),
         foregroundColor: onPrimaryColorDark,
         backgroundColor: primaryColorDark,
         disabledForegroundColor: gray6Color,
         disabledBackgroundColor: gray7Color,
         textStyle: smSemiBold,
       )
   );

   static final ChipThemeData _chipThemeData =  ChipThemeData(
     backgroundColor: gray11Color,
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(radiusXl)
     ),
     side: BorderSide(
       color: gray10Color,
       width: 1
     )
   );


   static final TextButtonThemeData _textButtonThemeData =  TextButtonThemeData(
     style: TextButton.styleFrom(
       minimumSize: Size.zero,
       padding: EdgeInsets.zero,
       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
     )

   );

   static final IconButtonThemeData _iconButtonThemeData =  IconButtonThemeData(
       style: IconButton.styleFrom(
         minimumSize: Size.zero,
         padding: EdgeInsets.zero,
         tapTargetSize: MaterialTapTargetSize.shrinkWrap,
       )

   );

   static final BottomSheetThemeData _bottomSheetThemeDataLight = BottomSheetThemeData(
       backgroundColor: backgroundColorLight,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(radiusLg),
             topRight: Radius.circular(radiusLg),
           )
       ),
   );

   static final BottomSheetThemeData _bottomSheetThemeDataDark = BottomSheetThemeData(
     backgroundColor: backgroundColorDark,
     shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(radiusLg),
           topRight: Radius.circular(radiusLg),
         )
     ),
   );


}