#!/bin/bash

#Чтобы создать alias для команды `ls -la` и назвать его `ll`, достаточно выполнить следующую команду в терминале:

alias ll='ls -la'

# Однако, этот alias будет действовать только в текущей сессии. Чтобы сделать его постоянным, нужно добавить эту команду
# в файл конфигурации `~/.bashrc`.

#Демонстрация автодополнения для команды `cd`:

#Автодополнение, обычно, уже включено в большинстве Unix/Unix-подобных систем. Чтобы использовать автодополнение
# с командой `cd` необходимо набрать `cd`, начать вводить имя директории, нажать клавишу `Tab`, и система автоматически
# дополнит имя каталога