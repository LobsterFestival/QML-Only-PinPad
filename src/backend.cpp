#include "backend.h"
#include <QDebug>
#include <QQmlFile>

Backend::Backend(QObject *parent)
    : QObject{parent},
    m_password(""),
    m_passwordFileName("")
{}

QString Backend::password()
{
    return m_password;
}

QString Backend::passwordFileName()
{
    return m_passwordFileName;
}

void Backend::setPassword(const QString &password)
{
    if(password == m_password)
        return;

    m_password = password;
    emit passwordChanged();
}

// Called when Enter button is clicked after loading a password file
void Backend::validatePassword(QByteArray firstLine)
{
    static QRegularExpression re("^\\d+$");
    QRegularExpressionMatch match = re.match(firstLine);
    if (match.hasMatch()) {
        m_secret = match.captured(0);
    }
    if(m_password == m_secret && m_password != ""){
        // transition to video player screen
        qDebug() << "Passwords Match!";
        emit validPasswordEntered();
    }
}

void Backend::setPasswordFileName(const QString &filename)
{
    if(filename == m_passwordFileName)
        return;

    m_passwordFileName = filename;
}

void Backend::digitClicked(QString digit)
{
    qDebug() << "digit "<< digit << " clicked!";
    m_password.append(digit);
    emit passwordChanged();
}

void Backend::enterClicked()
{
    qDebug() << "Enter clicked! Current entered password: " << m_password << " Password file name " << m_passwordFileName;
    if(m_passwordFileName == "")
        return;
    // needed to transform URL returned by QML to something QFile can open.
    QFile temp(QQmlFile::urlToLocalFileOrQrc(m_passwordFileName));
    if (!temp.open(QIODevice::ReadOnly | QIODevice::Text)){
        qDebug() << "Failed to open file";
        return;
    }

    QByteArray firstLine = temp.readLine();
    validatePassword(firstLine);
}

void Backend::openPassFileClicked()
{
    qDebug() << "open pass clicked";
}

void Backend::clearClicked()
{
    qDebug() << "Clear clicked!";
    m_password = "";
    emit passwordChanged();
}
