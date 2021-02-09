Pycharm для архитектуры arm64. 

1. Установка в home:

        $ cd ~
        $ sudo apt-get install openjdk-8-jdk
        $ wget https://download.jetbrains.com/python/pycharm-community-2019.1.2.tar.gz
        $ tar xvzf pycharm-community-2019.1.2.tar.gz
        $ pycharm-community-2019.1.2/bin/pycharm.sh

2. Настройка запуска из терминала:

Для запуска из терминала можно, например, добавить в ~/.bashrc функцию запуска:
    
    $ nano ~/.bashrc
    
    # Добавить в конец файла 
    pycharm() {
        echo "Starting PyCharm..."
        bash "$HOME/pycharm-community-2019.1.2/bin/pycharm.sh"
    
    
    }
    
    $ source ~/.bashrc

Тестировалось на Jetson Nano.