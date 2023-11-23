TARGET = netcatgui
TEMPLATE = app


QT += core gui network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

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
    resources/icons/save.png

RESOURCES += \
    resources/resources.qrc

RC_FILE = resources/ncgui.rc
