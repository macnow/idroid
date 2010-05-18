#!/bin/sh
echo 'iDroid Google Apps Installer 0.1 by macnow'
echo '------------------------------------------'

echo 'Downloading multilanguage Android 1.6 image... '
wget 'http://files.androidspin.com/enomther/ROM/AOSP_ADP_1.6_DRC83_rooted_base.zip' 2>&1 1>/dev/null
echo 'Unpacking downloaded image... '
unzip -d 'ASOP' 'AOSP_ADP_1.6_DRC83_rooted_base.zip'
echo 'Mounting system.img... '
mkdir 'system'
mount -o loop 'system.img' 'system/'

echo 'Installing Google Apps packages... '
cp 'ASOP/system/framework/com.google.android.gtalkservice.jar' 'system/framework'
cp 'ASOP/system/framework/com.google.android.maps.jar' 'system/framework'
cp 'ASOP/system/etc/permissions/com.google.android.gtalkservice.xml' 'system/etc/permissions'
cp 'ASOP/system/etc/permissions/com.google.android.maps.xml' 'system/etc/permissions'
cp 'ASOP/system/app/AlarmClock.apk' 'system/app'
cp 'ASOP/system/app/ApplicationsProvider.apk' 'system/app'
cp 'ASOP/system/app/Browser.apk' 'system/app'
cp 'ASOP/system/app/BugReport.apk' 'system/app'
cp 'ASOP/system/app/Calculator.apk' 'system/app'
cp 'ASOP/system/app/Calendar.apk' 'system/app'
cp 'ASOP/system/app/CalendarProvider.apk' 'system/app'
cp 'ASOP/system/app/Camera.apk' 'system/app'
cp 'ASOP/system/app/Contacts.apk' 'system/app'
cp 'ASOP/system/app/DownloadProvider.apk' 'system/app'
cp 'ASOP/system/app/DrmProvider.apk' 'system/app'
cp 'ASOP/system/app/Email.apk' 'system/app'
cp 'ASOP/system/app/EnhancedGoogleSearchProvider.apk' 'system/app'
cp 'ASOP/system/app/FieldTest.apk' 'system/app'
cp 'ASOP/system/app/GlobalSearch.apk' 'system/app'
cp 'ASOP/system/app/HTMLViewer.apk' 'system/app'
cp 'ASOP/system/app/ImProvider.apk' 'system/app'
cp 'ASOP/system/app/Launcher.apk' 'system/app'
cp 'ASOP/system/app/Maps.apk' 'system/app'
cp 'ASOP/system/app/MarketUpdater.apk' 'system/app'
cp 'ASOP/system/app/MediaProvider.apk' 'system/app'
cp 'ASOP/system/app/MediaUploader.apk' 'system/app'
cp 'ASOP/system/app/Mms.apk' 'system/app'
cp 'ASOP/system/app/Music.apk' 'system/app'
cp 'ASOP/system/app/NetworkLocation.apk' 'system/app'
cp 'ASOP/system/app/PackageInstaller.apk' 'system/app'
cp 'ASOP/system/app/PicoTts.apk' 'system/app'
cp 'ASOP/system/app/SoundRecorder.apk' 'system/app'
cp 'ASOP/system/app/Street.apk' 'system/app'
cp 'ASOP/system/app/TelephonyProvider.apk' 'system/app'
cp 'ASOP/system/app/TtsService.apk' 'system/app'
cp 'ASOP/system/app/UserDictionaryProvider.apk' 'system/app'
cp 'ASOP/system/app/VoiceDialer.apk' 'system/app'
cp 'ASOP/system/app/VoiceSearch.apk' 'system/app'
cp 'ASOP/system/app/VpnServices.apk' 'system/app'
cp 'ASOP/system/app/Gmail.apk' 'system/app'
cp 'ASOP/system/app/GmailProvider.apk' 'system/app'
cp 'ASOP/system/app/GoogleApps.apk' 'system/app'
cp 'ASOP/system/app/GoogleBackupTransport.apk' 'system/app'
cp 'ASOP/system/app/GoogleCheckin.apk' 'system/app'
cp 'ASOP/system/app/GoogleContactsProvider.apk' 'system/app'
cp 'ASOP/system/app/GooglePartnerSetup.apk' 'system/app'
cp 'ASOP/system/app/GoogleSettingsProvider.apk' 'system/app'
cp 'ASOP/system/app/GoogleSubscribedFeedsProvider.apk' 'system/app'
cp 'ASOP/system/app/gtalkservice.apk' 'system/app'
cp 'ASOP/system/app/Talk.apk' 'system/app'
cp 'ASOP/system/app/Vending.apk' 'system/app'
cp 'ASOP/system/app/YouTube.apk' 'system/app'
cp 'ASOP/system/app/SetupWizard.apk' 'system/app'
echo 'Uninstalling non-google Contacts application... '
rm -f 'system/app/ContactsProvider.apk'
echo 'Setting permissions... '
chmod 6755 'system/app/SetupWizard.apk'

echo 'Unmounting system.img'
umount 'system'
rmdir 'system'