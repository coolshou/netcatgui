#ifndef NCSESSIONCONNECTWIDGET_H
#define NCSESSIONCONNECTWIDGET_H

#include "ncsessionwidget.h"
#include <QTcpSocket>
#include <QUdpSocket>

class NcSessionConnectWidget : public NcSessionWidget
{
    Q_OBJECT

public:
    NcSessionConnectWidget(QWidget *parent = 0, bool EndMessagesWithNewLine = false, Encoding encoding = Encoding::Utf8);
    ~NcSessionConnectWidget();

private slots:
    void startConnect();
    void disconnect();
    void connectSuccess();
    void connectFailure(QAbstractSocket::SocketError socketError);
    void connectionDataAvailable();
    void sendMessageToHost();

private:
    bool isUDP;
    QTcpSocket hostConnection;
    QUdpSocket hostUDPConnection;
};

#endif // NCSESSIONCONNECTWIDGET_H
