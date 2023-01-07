import zipfile
import time
import threading

class BombZip:
    passwordLen = 9
    passwordDictStr = "0123456789"
    #判断线程是否终止
    flag = True
    startTime = 0.0
    def __init__(self, passwordLen, passwordDictStr) -> None:
        self.passwordDictStr = passwordDictStr
        self.passwordLen = passwordLen
        startTime = time.time()

    def __numberToPassword(self, n):
        result = ""
        for i in range(0, self.passwordLen):
            result += self.passwordDictStr[int(n) % len(self.passwordDictStr)]
            n = n / len(self.passwordDictStr)
        return result 

    def __extract(self, password, file):
        try:
            password = str(password)
            file.extractall(path='.', pwd=password.encode('utf-8'))
            print("the password is {}".format(password))
            nowTime = time.time()
            print("spend time is {}".format(nowTime - self.startTime))
            global flag
            #成功解压其余线程终止
            self.flag = False
        except Exception as e:
            return

    def bombZip(self, file):
        tryTotal= len(self.passwordDictStr)**self.passwordLen
        for i in range(0, tryTotal):
            tryPassword = self.__numberToPassword(i)
            self.__extract(tryPassword, file)
            if i %1000 == 0:
                print("number:{}, percent:{}%,password:{}".format(i, round(i/tryTotal*100, 2), tryPassword))
            if self.flag is True:
                t = threading.Thread(target=self.__extract, args=(tryPassword, file))
                t.start()
                t.join()



numberStrDict="0123456789"
alphaLowwerCaseStrDict="abcdefghijlmnopqrstuvwxyz"
alphaUpperCaseStrDict="ABCDEFGHIJKLMNOPQRSTUVWXYZ"



bombZip = BombZip(passwordDictStr=numberStrDict, passwordLen=6)
bombZip.bombZip("math.zip")
