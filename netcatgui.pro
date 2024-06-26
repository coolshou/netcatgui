TARGET = netcatgui
TEMPLATE = app


QT += core gui network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /usr/bin
!isEmpty(target.path): INSTALLS += target

INCLUDEPATH += src/ \
    src/widgets/

QMAKE_LFLAGS += -no-pie
SOURCES += src/main.cpp \
    src/netcatgui.cpp \
    src/widgets/ncsessionwidget.cpp \
    src/widgets/ncsessionlistenwidget.cpp \
    src/widgets/ncsessionconnectwidget.cpp \
    src/widgets/customplaintextedit.cpp
HEADERS += src/netcatgui.h \
    src/widgets/ncsessionwidget.h \
    src/widgets/ncsessionlistenwidget.h \
    src/widgets/ncsessionconnectwidget.h \
    src/util.h \
    src/widgets/customplaintextedit.h
FORMS += src/netcatgui.ui \
    src/widgets/ncsessionwidget.ui

OTHER_FILES += \
    resources/icons/listen.png \
    resources/icons/icons_readme.txt \
    resources/icons/connect.png \
    resources/ncgui.rc \
    resources/icons/save.png \
    resources/icons/netcatgui.png

unix {

    DESKTOP.files += \
        src/netcatgui.desktop
    DESKTOP.path += \
        "/usr/share/applications/"
    IMAGES.files += \
        resources/icons/netcatgui.png
    IMAGES.path += \
        "/usr/share/pixmaps/"
    INSTALLS += DESKTOP IMAGES
}

RESOURCES += \
    resources/resources.qrc

win32 {
    # RC_FILE = resources/ncgui.rc
    VERSION = 1.0.2024.0516
    RC_ICONS = resources/icons/netcatgui.ico
    QMAKE_TARGET_COMPANY = "coolshou.idv"
    QMAKE_TARGET_PRODUCT = "netcatgui"
    QMAKE_TARGET_DESCRIPTION = "a simple gui program that is set to emulate netcat(nc)"
    QMAKE_TARGET_COPYRIGHT = "Copyright 2023-2024 . All rights reserved."
}
