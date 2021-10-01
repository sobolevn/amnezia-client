import QtQuick 2.12
import QtQuick.Controls 2.12
import ProtocolEnum 1.0
import "../"
import "../../Controls"
import "../../Config"

PageProtocolBase {
    id: root
    protocol: ProtocolEnum.Sftp
    logic: UiLogic.protocolLogic(protocol)

    BackButton {
        id: back
    }

    Caption {
        id: caption
        text: qsTr("SFTF settings")
    }

    Rectangle {
        id: frame_settings
        width: parent.width
        anchors.top: caption.bottom
        anchors.topMargin: 10

        border.width: 1
        border.color: "lightgray"
        anchors.bottomMargin: 5
        anchors.horizontalCenter: parent.horizontalCenter
        radius: 2
        Grid {
            id: grid
            anchors.fill: parent
            columns: 2
            horizontalItemAlignment: Grid.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter
            topPadding: 5
            leftPadding: 30
            rightPadding: 30
            spacing: 5


            LabelType {
                width: 130
                text: qsTr("Port")
            }
            TextFieldType {
                id: tf_port_num
                width: parent.width - 130 - parent.spacing - parent.leftPadding * 2
                text: logic.labelTftpPortText
                readOnly: true
            }

            LabelType {
                width: 130
                text: qsTr("User Name")
            }
            TextFieldType {
                id: tf_user_name
                width: parent.width - 130 - parent.spacing - parent.leftPadding * 2
                text: logic.labelTftpUserNameText
                readOnly: true
            }

            LabelType {
                width: 130
                text: qsTr("Password")
            }
            TextFieldType {
                id: tf_password
                width: parent.width - 130 - parent.spacing - parent.leftPadding * 2
                text: logic.labelTftpPasswordText
                readOnly: true
            }
        }
    }

    LabelType {
        anchors.bottom: check_persist.top
        anchors.bottomMargin: 10
        width: parent.width - 60
        x: 30
        font.pixelSize: 14
        textFormat: Text.RichText

        MouseArea {
            anchors.fill: parent
            cursorShape: parent.hoveredLink ? Qt.PointingHandCursor : Qt.ArrowCursor
            acceptedButtons: Qt.NoButton
        }

//        text: "In order to mount remote SFTP folder as local drive, perform following steps:
//- Install the latest version of WinFsp [https://github.com/billziss-gh/winfsp/releases/latest].
//- Install the latest version of SSHFS-Win. Choose the x64 or x86 installer according to your computer's architecture [https://github.com/billziss-gh/sshfs-win/releases]"
        onLinkActivated: Qt.openUrlExternally(link)

        text:"In order to mount remote SFTP folder as local drive, perform following steps:
<ul>
<li>Install the latest version of <a href=\"https://github.com/billziss-gh/winfsp/releases/latest\">WinFsp</a>.</li>
<li>Install the latest version of <a href=\"https://github.com/billziss-gh/sshfs-win/releases\">SSHFS-Win</a>. Choose the x64 or x86 installer according to your computer's architecture.</li>
</ul>"
    }

    CheckBoxType {
        id: check_persist
        anchors.bottom: pb_mount.top
        anchors.bottomMargin: 10
        x: 30
        width: parent.width
        height: 21
        text: qsTr("Restore drive after restart")
        checked: logic.checkBoxSftpRestoreChecked
        onCheckedChanged: {
            logic.checkBoxSftpRestoreChecked = checked
        }
        onClicked: {
            logic.checkBoxSftpRestoreClicked()
        }
    }

    BlueButtonType {
        id: pb_mount
        enabled: logic.pushButtonSftpMountEnabled
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        x: 30
        width: parent.width - 60
        height: 40
        text: qsTr("Mount drive")
        onClicked: {
            logic.onPushButtonSftpMountDriveClicked()
        }
    }
}