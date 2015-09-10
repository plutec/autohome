# -*- coding: iso-8859-15 -*-
import os
import random
import settings
import time
import requests
import bot

HELP_TEXT = """
/help -> Te muestro esta ayuda
/hum -> Te digo la humedad relativa que hay en la terraza
/temp -> Te digo la temperatura que hay en la terraza
"""


class Central(bot.TelegramBot):

    def __init__(self):
        random.seed(time.time())
        bot.TelegramBot.__init__(self)



    def _send_help(self, message):
        """
            Send commands availables to the group
        """
        self.send_msg(message.chat_id, HELP_TEXT)

    def _send_temp(self, message):
        """
            Send the actually temp
        """
        res = requests.get('http://192.168.1.201')
        temp = res.json().get('temp')
        self.send_msg(message.chat_id, "%d °C" % temp)

    def _send_hum(self, message):
        """
            Send the actually humidity
        """
        res = requests.get('http://192.168.1.201')
        hum = res.json().get('hum')
        self.send_msg(message.chat_id, "%d%%" % hum)


    def process_update(self, message):
        if message.get_text() == '/temp':
            self._send_temp(message)

        elif message.get_text() == '/help':
            self._send_help(message)

        elif message.get_text() == '/hum':
            self._send_hum(message)

        else:
            self.send_msg(message.chat_id, "No te he entendido, prueba con /help")

def main():
    bot = Central()
    bot.run()

if __name__ == '__main__':
    main()
