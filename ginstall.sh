#!/bin/bash

V_IP="192.168.0.3"		#IPHONE IP
V_PASS="alpine"			#IPHONE ROOT PASSWORD

V_VERSION="0.2"
V_WORKDIR=$(pwd)
V_MNT=$V_WORKDIR
V_ROMURL="http://files.androidspin.com/enomther/ROM/AOSP_ADP_1.6_DRC83_rooted_base.zip" 

isDebian() {

  if [ -f "/etc/debian_version" ]
  then
	return 1
  else
	return 0
  fi
}

init() {
	sudo echo 1 > /dev/null
	echo -e "\niDroid Google Apps Installer $V_VERSION by macnow\n------------------------------------------\n\n"
}

err_check() {
	if [ $ERR -ne 0 ]; then
		echo "An error occured!"
		echo "Please launch again the script with 'sh -x ginstall.sh' for having more info!"
		exit;
	fi
	echo "[ OK ]"
}

create_dir() {
	echo -e "\nTesting if system dir exists... \c"	
	if [ -d "$V_MNT/system" ]; then
		echo "[ OK ]";
	else
		sudo mkdir "$V_MNT/system"
		ERR=$?
		err_check
	fi
}

download_aosp_rom() {
	echo -e "\nDownloading multilanguage Android 1.6 ROM... \c"
	if [ -f "$V_WORKDIR/AOSP_ADP_1.6_DRC83_rooted_base.zip" ]; then
		echo "[ AOSP ROM file found! ]"
	else
		sudo wget "$V_ROMURL" -P "$V_WORKDIR" 2>&1 1>/dev/null
		ERR=$?
		err_check
	fi
}
unpack_aosp_rom() {
	echo -e "\nUnpacking downloaded ROM... \c"
	if [ -d "$V_WORKDIR/AOSP" ]; then
		echo "[ Already unpacked! ]"
	else
		sudo unzip -d "$V_WORKDIR/AOSP" "$V_WORKDIR/AOSP_ADP_1.6_DRC83_rooted_base.zip"
		ERR=$?
		err_check
	fi
}
mount_system_image() {
	echo -e "\nMounting system.img... \c"
	sudo mount -o loop "system.img" "$V_WORKDIR/system/"
	ERR=$?
	err_check
}
umount_system_image() {
	echo -e "\nUnmounting system.img... \c"
	sudo umount "$V_WORKDIR/system/"
	ERR=$?
	err_check
}
install_google_apps() {
	echo -e "\nInstalling Google Apps packages... \c"
	sudo cp "$V_WORKDIR/AOSP/system/framework/com.google.android.gtalkservice.jar" "$V_MNT/system/framework"
	sudo cp "$V_WORKDIR/AOSP/system/framework/com.google.android.maps.jar" "$V_MNT/system/framework"
	sudo cp "$V_WORKDIR/AOSP/system/etc/permissions/com.google.android.gtalkservice.xml" "$V_MNT/system/etc/permissions"
	sudo cp "$V_WORKDIR/AOSP/system/etc/permissions/com.google.android.maps.xml" "$V_MNT/system/etc/permissions"
	sudo cp "$V_WORKDIR/AOSP/system/app/AlarmClock.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/ApplicationsProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Browser.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/BugReport.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Calculator.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Calendar.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/CalendarProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Camera.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Contacts.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/DownloadProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/DrmProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Email.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/EnhancedGoogleSearchProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/FieldTest.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GlobalSearch.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/HTMLViewer.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/ImProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Launcher.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Maps.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/MarketUpdater.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/MediaProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/MediaUploader.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Mms.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Music.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/NetworkLocation.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/PackageInstaller.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/PicoTts.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/SoundRecorder.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Street.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/TelephonyProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/TtsService.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/UserDictionaryProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/VoiceDialer.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/VoiceSearch.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/VpnServices.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Gmail.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GmailProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GoogleApps.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GoogleBackupTransport.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GoogleCheckin.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GoogleContactsProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GooglePartnerSetup.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GoogleSettingsProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/GoogleSubscribedFeedsProvider.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/gtalkservice.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Talk.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/Vending.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/YouTube.apk" "$V_MNT/system/app"
	sudo cp "$V_WORKDIR/AOSP/system/app/SetupWizard.apk" "$V_MNT/system/app"

	ERR=$?
	err_check

	echo -e "\nUninstalling non-Google Contacts application... \c"
	sudo rm -f "$V_WORKDIR/system/app/ContactsProvider.apk"
	ERR=$?
	err_check

	echo -e "\nSetting permissions for SetupWizard... \c"
	sudo chmod 6755 "$V_WORKDIR/system/app/SetupWizard.apk"
	ERR=$?
	err_check
}

init
create_dir
download_aosp_rom
unpack_aosp_rom
mount_system_image
install_google_apps
umount_system_image
