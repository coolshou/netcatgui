; Script generated with the Venis Install Wizard

; Define your application name
!define APPNAME "netcatgui"
!define APPVERSION 1.0
!define APPFileVersion 1.0.2024.0516
!define APPDOMAIN "coolshou.idv.tw"
!define APPURL "https://github.com/coolshou/netcatgui"

!define ARP "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"

VIProductVersion ${APPFileVersion}
!define APPNAMEANDVERSION "netcatgui ${APPVERSION}"
!define WIN64 ; comment out for 32 bit

; Main Install settings
Name "${APPNAMEANDVERSION}"
InstallDir "$PROGRAMFILES\${APPNAME}"
InstallDirRegKey HKLM "Software\${APPNAME}" ""
OutFile "${APPNAME}-${APPFileVersion}-setup.exe"

!include "FileFunc.nsh"
!include "x64.nsh"
; Use compression
SetCompressor LZMA

; Modern interface settings
!include "MUI.nsh"

!define MUI_ABORTWARNING
!define MUI_ICON "resources\icons\netcatgui.ico"
!define MUI_FINISHPAGE_RUN "$INSTDIR\netcatgui.exe"

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE.txt"
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_RESERVEFILE_LANGDLL

VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${APPNAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductVersion" "${APPVERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "a simple gui program that is set to emulate netcat(nc)"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${APPDOMAIN}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "${APPNAME} is a trademark of ${APPDOMAIN}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "(C) ${APPDOMAIN}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "${APPNAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${APPFileVersion}"

Section "netcatgui" Section1

	; Set Section properties
	SetOverwrite on

	; Set Section Files and Shortcuts
	SetOutPath "$INSTDIR\"
	File "resources\icons\netcatgui.ico"
	File "release\D3Dcompiler_47.dll"
	File "release\Qt5Core.dll"
	File "release\Qt5Gui.dll"
	File "release\Qt5Network.dll"
	File "release\Qt5Svg.dll"
	File "release\Qt5Widgets.dll"
	File "release\libEGL.dll"
	File "release\libGLESv2.dll"
	File "release\libgcc_s_seh-1.dll"
	File "release\libstdc++-6.dll"
	File "release\libwinpthread-1.dll"
	File "release\netcatgui.exe"
	File "release\opengl32sw.dll"
	SetOutPath "$INSTDIR\bearer"
  File "release\bearer\qgenericbearer.dll"
	SetOutPath "$INSTDIR\iconengines"
	File "release\iconengines\qsvgicon.dll"
	SetOutPath "$INSTDIR\imageformats"
	File "release\imageformats\qgif.dll"
	File "release\imageformats\qicns.dll"
	File "release\imageformats\qico.dll"
	File "release\imageformats\qjpeg.dll"
	File "release\imageformats\qsvg.dll"
	File "release\imageformats\qtga.dll"
	File "release\imageformats\qtiff.dll"
	File "release\imageformats\qwbmp.dll"
	File "release\imageformats\qwebp.dll"
	SetOutPath "$INSTDIR\platforms"
	File "release\platforms\qwindows.dll"
	SetOutPath "$INSTDIR\styles"
	File "release\styles\qwindowsvistastyle.dll"
	SetOutPath "$INSTDIR\translations"
	File "release\translations\qt_ar.qm"
	File "release\translations\qt_bg.qm"
	File "release\translations\qt_ca.qm"
	File "release\translations\qt_cs.qm"
	File "release\translations\qt_da.qm"
	File "release\translations\qt_de.qm"
	File "release\translations\qt_en.qm"
	File "release\translations\qt_es.qm"
	File "release\translations\qt_fi.qm"
	File "release\translations\qt_fr.qm"
	File "release\translations\qt_gd.qm"
	File "release\translations\qt_he.qm"
	File "release\translations\qt_hu.qm"
	File "release\translations\qt_it.qm"
	File "release\translations\qt_ja.qm"
	File "release\translations\qt_ko.qm"
	File "release\translations\qt_lv.qm"
	File "release\translations\qt_pl.qm"
	File "release\translations\qt_ru.qm"
	File "release\translations\qt_sk.qm"
	File "release\translations\qt_tr.qm"
	File "release\translations\qt_uk.qm"
	File "release\translations\qt_zh_TW.qm"
	CreateShortCut "$DESKTOP\netcatgui.lnk" "$INSTDIR\netcatgui.exe" "" "$INSTDIR\netcatgui.ico"
	CreateDirectory "$SMPROGRAMS\netcatgui"
	CreateShortCut "$SMPROGRAMS\netcatgui\netcatgui.lnk" "$INSTDIR\netcatgui.exe"
	CreateShortCut "$SMPROGRAMS\netcatgui\Uninstall.lnk" "$INSTDIR\uninstall.exe"

; get cumulative size of all files in and under install dir
; report the total in KB (decimal)
; place the answer into $0  (ignore $1 $2)
${GetSize} "$INSTDIR" "/S=0K" $0 $1 $2

; Convert the decimal KB value in $0 to DWORD
; put it right back into $0
IntFmt $0 "0x%08X" $0

; Create/Write the reg key with the dword value
WriteRegDWORD HKLM "${ARP}" "EstimatedSize" "$0"

SectionEnd

Section -FinishSection

	WriteRegStr HKLM "Software\${APPNAME}" "" "$INSTDIR"
	WriteRegStr HKLM "${ARP}" "DisplayName" "${APPNAME}"
	WriteRegStr HKLM "${ARP}" "DisplayIcon" "$INSTDIR\netcatgui.ico"
	WriteRegStr HKLM "${ARP}" "DisplayVersion" "${APPFileVersion}"
	WriteRegStr HKLM "${ARP}" "Publisher" "${APPDOMAIN}"
	WriteRegStr HKLM "${ARP}" "HelpLink" "https://github.com/coolshou/netcatgui/releases"
	WriteRegStr HKLM "${ARP}" "UninstallString" "$INSTDIR\uninstall.exe"
	WriteUninstaller "$INSTDIR\uninstall.exe"

SectionEnd

; Modern install component descriptions
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
	!insertmacro MUI_DESCRIPTION_TEXT ${Section1} ""
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Uninstall section
Section Uninstall
	; Delete self
	Delete "$INSTDIR\uninstall.exe"

	; Delete Shortcuts
	Delete "$DESKTOP\netcatgui.lnk"
	Delete "$SMPROGRAMS\netcatgui\netcatgui.lnk"
	Delete "$SMPROGRAMS\netcatgui\Uninstall.lnk"

	; Clean up netcatgui
	Delete "$INSTDIR\netcatgui.ico"
	Delete "$INSTDIR\D3Dcompiler_47.dll"
	Delete "$INSTDIR\Qt5Core.dll"
	Delete "$INSTDIR\Qt5Gui.dll"
	Delete "$INSTDIR\Qt5Network.dll"
	Delete "$INSTDIR\Qt5Svg.dll"
	Delete "$INSTDIR\Qt5Widgets.dll"
	Delete "$INSTDIR\libEGL.dll"
	Delete "$INSTDIR\libGLESv2.dll"
	Delete "$INSTDIR\libgcc_s_seh-1.dll"
	Delete "$INSTDIR\libstdc++-6.dll"
	Delete "$INSTDIR\libwinpthread-1.dll"
	Delete "$INSTDIR\netcatgui.exe"
	Delete "$INSTDIR\opengl32sw.dll"
	Delete "$INSTDIR\bearer\qgenericbearer.dll"
	Delete "$INSTDIR\iconengines\qsvgicon.dll"
	Delete "$INSTDIR\imageformats\qgif.dll"
	Delete "$INSTDIR\imageformats\qicns.dll"
	Delete "$INSTDIR\imageformats\qico.dll"
	Delete "$INSTDIR\imageformats\qjpeg.dll"
	Delete "$INSTDIR\imageformats\qsvg.dll"
	Delete "$INSTDIR\imageformats\qtga.dll"
	Delete "$INSTDIR\imageformats\qtiff.dll"
	Delete "$INSTDIR\imageformats\qwbmp.dll"
	Delete "$INSTDIR\imageformats\qwebp.dll"
	Delete "$INSTDIR\platforms\qwindows.dll"
	Delete "$INSTDIR\styles\qwindowsvistastyle.dll"
	Delete "$INSTDIR\translations\qt_ar.qm"
	Delete "$INSTDIR\translations\qt_bg.qm"
	Delete "$INSTDIR\translations\qt_ca.qm"
	Delete "$INSTDIR\translations\qt_cs.qm"
	Delete "$INSTDIR\translations\qt_da.qm"
	Delete "$INSTDIR\translations\qt_de.qm"
	Delete "$INSTDIR\translations\qt_en.qm"
	Delete "$INSTDIR\translations\qt_es.qm"
	Delete "$INSTDIR\translations\qt_fi.qm"
	Delete "$INSTDIR\translations\qt_fr.qm"
	Delete "$INSTDIR\translations\qt_gd.qm"
	Delete "$INSTDIR\translations\qt_he.qm"
	Delete "$INSTDIR\translations\qt_hu.qm"
	Delete "$INSTDIR\translations\qt_it.qm"
	Delete "$INSTDIR\translations\qt_ja.qm"
	Delete "$INSTDIR\translations\qt_ko.qm"
	Delete "$INSTDIR\translations\qt_lv.qm"
	Delete "$INSTDIR\translations\qt_pl.qm"
	Delete "$INSTDIR\translations\qt_ru.qm"
	Delete "$INSTDIR\translations\qt_sk.qm"
	Delete "$INSTDIR\translations\qt_tr.qm"
	Delete "$INSTDIR\translations\qt_uk.qm"
	Delete "$INSTDIR\translations\qt_zh_TW.qm"

	; Remove remaining directories
	RMDir "$SMPROGRAMS\netcatgui"
	RMDir /r "$INSTDIR\"
	${If} ${RunningX64}
	!ifdef WIN64
		SetRegView 64
	!endif
	${EndIf}
	;Remove from registry...
	DeleteRegKey HKLM "${ARP}"
	DeleteRegKey HKLM "Software\${APPNAME}"

SectionEnd

BrandingText "netcat gui"

Function .onInit
	${If} ${RunningX64}
	!ifdef WIN64
		SetRegView 64
	!endif
	${Else}
	!ifdef WIN64
		MessageBox MB_OK|MB_ICONSTOP 'This is the 64 bit ${APPNAME} installer$\r$\nPlease download the 32 bit version $\r$\nClick Ok to quit Setup.'
		Quit
	!endif
	${EndIf}
!ifdef WIN64
  strcpy $INSTDIR "$PROGRAMFILES64\${APPNAME}"
!endif

FunctionEnd
; eof
