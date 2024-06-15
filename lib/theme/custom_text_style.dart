import 'package:flutter/material.dart'; 
import '../utils/app_export.dart';

extension on TextStyle {
  TextStyle get sansation { 
    return copyWith(
      fontFamily: 'Sansation',
    );
  }

  TextStyle get sFPro {
    return copyWith(
      fontFamily: 'SF Pro',
    );
  }

  TextStyle get openSans {
    return copyWith(
      fontFamily: 'Open Sans',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get cabin {
    return copyWith(
      fontFamily: 'Cabin',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }
}




class CustomTextStyles {
  // Body text style
  static get bodyLargeCabin => theme.textTheme.bodyLarge!.cabin.copyWith(
    fontSize: 16.fSize,
  );
  static get bodyLargeCabinCyan400 => theme.textTheme.bodyLarge!.cabin.copyWith(
    color: appTheme.cyan400,
    fontSize: 18.fSize,
  );
  static get bodyLargeCabinCyan40018 => 
    theme.textTheme.bodyLarge!.cabin.copyWith(
      color: appTheme.cyan400,
      fontSize: 18.fSize,
  );
  static get bodyLargeCabinGray60004 => 
    theme.textTheme.bodyLarge!.cabin.copyWith( 
      color: appTheme.gray60004,
      fontSize: 18.fSize,
  );
  static get bodyLargeCabinGray6000418 =>
    theme.textTheme.bodyLarge!.cabin.copyWith(
      color: appTheme.gray60004,
      fontSize: 18.fSize,
  );
  static get bodyLargeInter => theme.textTheme.bodyLarge!.inter.copyWith( 
    fontSize: 16.fSize,
  );
  static get bodyLargePoppins => theme.textTheme.bodyLarge!.poppins.copyWith( 
    fontSize: 16.fSize,
  );
  static get bodyLargePoppinsGray60002 =>
    theme.textTheme.bodyLarge!.poppins.copyWith(
      color: appTheme.gray60002,
      fontSize: 16.fSize,
  );
  static get bodyLargePoppinsGray60003 =>
    theme.textTheme.bodyLarge!.poppins.copyWith(
      color: appTheme.gray60003,
      fontSize: 16.fSize,
  );
  static get bodyLargeSFPro => theme.textTheme.bodyLarge!.sFPro.copyWith(
    fontSize: 16.fSize,
  );
  static get bodyLargeSansationCyan400 =>
    theme.textTheme.bodyLarge!.sansation.copyWith(
      color: appTheme.cyan400,
      fontSize: 16.fSize,
  );
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith( 
    color: appTheme.black900,
    fontWeight: FontWeight.w300,
  );
  static get bodyMediumBlack90013 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 13.fSize,
  );
  static get bodyMediumBlack900Light => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.black900,
    fontSize: 13.fSize,
    fontWeight: FontWeight.w300,
  );
  static get bodyMediumBlack900Light_1 => theme.textTheme.bodyMedium!.copyWith(
    color: appTheme.black900,
    fontWeight: FontWeight.w300,
  );
  static get bodyMediumBlack900_1 => theme.textTheme.bodyMedium!.copyWith( 
    color: appTheme.black900,
  );
  static get bodyMediumInterBlack900 =>
    theme.textTheme.bodyMedium!.inter.copyWith(
      color: appTheme.black900,
      fontSize: 13.fSize,
  );
  static get bodyMediumInterBlack90015 =>
    theme.textTheme.bodyMedium!.inter.copyWith(
      color: appTheme.black900,
      fontSize: 15.fSize,
  );
  static get bodyMediumSFProBlack900 =>
    theme.textTheme.bodyMedium!.sFPro.copyWith(
      color: appTheme.black900,
      fontSize: 15.fSize,
  );
  static get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.black900,
    fontSize: 9.fSize,
    fontWeight: FontWeight.w300,
  );
  static get bodySmallBlack900_1 => theme.textTheme.bodySmall!.copyWith( 
    color: appTheme.black900,
  );
  static get bodySmallCabinBlack900 =>
    theme.textTheme.bodySmall!.cabin.copyWith( 
      color: appTheme.black900,
      fontSize: 11.fSize,
  );
  static get bodySmallCabinGray60004 =>
    theme.textTheme.bodySmall!.cabin.copyWith( 
      color: appTheme.gray60004,
      fontSize: 11.fSize,
  );
  static get bodySmallCabinOnPrimaryContainer =>
    theme.textTheme.bodySmall!.cabin.copyWith(
      color: theme.colorScheme.onPrimaryContainer,
  );
  static get bodySmallCyan400 => theme.textTheme.bodySmall!.copyWith( 
    color: appTheme.cyan400,
    fontSize: 10.fSize,
  );
  static get bodySmallGray400 => theme.textTheme.bodySmall!.copyWith( 
    color: appTheme.gray400,
    fontSize: 10.fSize,
  );
  static get bodySmallGray40010 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray400,
    fontSize: 10.fSize,
  );
  static get bodySmallGray400_1 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray400,
  );
  static get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray600,
  );
  static get bodySmallGray700 => theme.textTheme.bodySmall!.copyWith(
    color: appTheme.gray700,
    fontSize: 10.fSize,
  );
  static get bodySmallInterBlack900 =>
    theme.textTheme.bodySmall!.inter.copyWith(
      color: appTheme.black900.withOpacity(0.8),
      fontSize: 10.fSize,
  );
  static get bodySmallInterBlack90011 =>
    theme.textTheme.bodySmall!.inter.copyWith( 
      color: appTheme.black900,
      fontSize: 11.fSize,
  );
  static get bodySmallInterBlack900Light =>
    theme.textTheme.bodySmall!.inter.copyWith(
      color: appTheme.black900,
      fontSize: 10.fSize,
      fontWeight: FontWeight.w300,
  );
  static get bodySmallOnPrimaryContainer => theme.textTheme.bodySmall!.copyWith( 
    color: theme.colorScheme.onPrimaryContainer,
  );
  static get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
    color: theme.colorScheme.primary,
    fontSize: 10.fSize,
  );
  // Headline text style
  static get headlineLargeBold => theme.textTheme.headlineLarge!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get headlineLargeBold_1 => theme.textTheme.headlineLarge!.copyWith(
    fontWeight: FontWeight.w700,
  );
  // Label text style
  static get labelLargeNunitoGray500 =>
    theme.textTheme.labelLarge!.nunito.copyWith(
      color: appTheme.gray500,
      fontWeight: FontWeight.w700,
  );
  // Poppins text style
  static get poppinsGray60003 => TextStyle(
      color: appTheme.gray60003,
      fontSize: 6.fSize,
      fontWeight: FontWeight.w400,
    ).poppins;
  static get poppinsOnPrimaryContainer => TextStyle(
      color: theme.colorScheme.onPrimaryContainer,
      fontSize: 6.fSize,
      fontWeight: FontWeight.w600,
    ).poppins;
  // Title style
  static get titleLargeInter => theme.textTheme.titleLarge!.inter;
  static get titleLargePoppinsOnPrimaryContainer =>
    theme.textTheme.titleLarge!.poppins.copyWith(
    color: theme.colorScheme.onPrimaryContainer,
    fontWeight: FontWeight.w500,
  );
  static get titleLargeSemiBold => theme.textTheme.titleLarge!.copyWith( 
    fontSize: 22.fSize,
    fontWeight: FontWeight.w600,
  );
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black900,
  );
  static get titleMediumBlack900_1 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black900,
  );
  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
    fontWeight: FontWeight.w700,
  );
  static get titleMediumInterBlack900 => 
    theme.textTheme.titleMedium!.inter.copyWith( 
      color: appTheme.black900,
      fontWeight: FontWeight.w700,
    );
  static get titleMediumSansationCyan400 =>
    theme.textTheme.titleMedium!.sansation.copyWith(
      color: appTheme.cyan400,
      fontWeight: FontWeight.w700,
    );
  static get titleMediumSansationCyan400Bold =>
    theme.textTheme.titleMedium!.sansation.copyWith(
      color: appTheme.cyan400,
      fontWeight: FontWeight.w700,
    );
  static get titleSmallBlack900 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900,
  );
  static get titleSmallBlack900Medium => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallBlack900_1 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.black900,
  );
  static get titleSmallBlue400 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blue400,
    fontWeight: FontWeight.w600,
  );
  static get titleSmallBlue400_1 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.blue400,
  );
  static get titleSmallGray400 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray400,
  );
  static get titleSmallGray60004 => theme.textTheme.titleSmall!.copyWith(
    color: appTheme.gray60004,
    fontSize: 15.fSize,
    fontWeight: FontWeight.w500,
  );
  static get titleSmallOpenSansBlack900 =>
    theme.textTheme.titleSmall!.openSans.copyWith(
      color: appTheme.black900,
      fontSize: 15.fSize,
    );
}