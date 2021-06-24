from PySide6.QtCore import *
from PySide6.QtQml import *
from PySide6.QtGui import *
import sys
import os

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "app.qml"))
    if not engine.rootObjects():
        sys.exit(-1)
    try:
        sys.exit(app.exec_())
    except:
        pass