#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <QFile>
#include <QRegularExpression>

class Backend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged FINAL)
    Q_PROPERTY(QString passwordFileName READ passwordFileName WRITE setPasswordFileName CONSTANT FINAL)
public:
    explicit Backend(QObject *parent = nullptr);
    void setPassword(const QString &password);
    void validatePassword(QByteArray firstLine);
    void setPasswordFileName(const QString &filename);

signals:
    void passwordChanged();
    // Used to transition to Video Screen
    void validPasswordEntered();
public slots:
    QString password();
    QString passwordFileName();

    void digitClicked(QString digit);
    void clearClicked();
    void enterClicked();
    void openPassFileClicked();
private:
    // m_password is currently entered password, updates password entry field
    QString m_password;
    // m_secret is the password loaded from password file, used to compare against m_password for validation
    QString m_secret;
    QString m_passwordFileName;

};

#endif // BACKEND_H
