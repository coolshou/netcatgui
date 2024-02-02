#include "netcatgui.h"
#include <QIcon>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    a.setWindowIcon(QIcon(":/toolbar/icons/netcatgui.png"));
    NetcatGUI w;
    w.show();
    return a.exec();
}
