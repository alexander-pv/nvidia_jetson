
Content:
<a id='start'></a>
[EN Manual](#en_manual)
[RU Manual](#ru_manual)

##### EN:
##### Installing JetPack on Jetson Nano. Linux OS.
<a id='en_manual'></a>

The minimum amount of memory to microSD: 32Gb. 16Gb is enough for tests, but almost all the space will be occupied by the system.
Minimum microSD class for stable operation : 10.

1. Connect microSD to your computer, use the file system monitoring utility to localize microSD:
    
        $ $df -Th

The T flag displays information about the file system type.
The h flag will present data in a readable tabular format in the terminal.

Find the address of the card: /dev/sd<x>

If the microSD is not found, you can also use the utilities:

    $ sudo gnome-disks
    $ sudo gparted
    $ sudo parted -l

Learn more about df: https://ru.wikipedia.org/wiki/Df

2. Download the image for Jetson Nano jetson-nano-developer-kit-sd-card-image.you can download it from the official website https://developer.nvidia.com/embedded/jetpack. You can also download a link to the latest image for Jetson Nano from the official Page of the following manual:
https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write

3. Write an image of the received system:

        $ /usr/bin/unzip -p ~/Downloads/jetson-nano-developer-kit-sd-card-image.zip | sudo /bin/dd of=/dev/sd<x> bs=1M status=progress

where /dev/sd<x> is the address of the connected microSD found using the $df - Th command.

---
For example, for the detected /dev/sdb1 vfat 30G 32K 30G 1% /media/alexander/9016-4EF8:
/usr/bin/unzip -p ~/Downloads/jetson-nano-developer-kit-sd-card-image.zip | sudo /bin/dd of=/dev/sdb bs=1M status=progress
---

it is important to write to the disk itself, not its partition: /dev/sdb1 - partition, /dev/sdb - disk. When writing to a partition, no comments will be issued, and bootloader will not be able to start the system.

If the image is not Packed in an archive (. img format), just enter:

    $ sudo umount /dev/sd<x>
    $ sudo dd if=~/Downloads/image.img of=/dev/sdb bs=1M status=progress

alternative installation: using the GUI interface with the balenaEtcher device firmware utility.

4. Remove the microSD card after loading:
    
       $ sudo eject /dev/sd<x>

---
If there is no Wifi-USB module to connect to the network, you can draw a network bridge, for example, in conjunction with another Linux via Ethernet.
To do this, you can use the nm-connection editor utility in the terminal.
For the network donor, select Method: Shared to other computers in the IPv4 Settings tab in the window that appears.
To take effect of the network bridge, reconnect the Ethernet connection on the recipient.
---

To fully configure the Jetson device after installing OS: (Opencl&CUDA, Tensorflow 2.2, DeepStream 5)

Download from the official website https://developer.nvidia.com/deepstream-getting-started Deep Stream 5.x.x for Jetson installer to the Directory
    
    ~/<your_path>/nvidia_jetson/jetso_nano.

Rename the installer to the default name for automatic installation:
    
    $ $ mv deep stream-5.x.x_amd64.deb deepsteam_amd64.deb

Run the installer:

    $ cd ~/<your_path>/nvidia_jetson/jetso_nano
    $ chmod +x ./jetson_nano_jetpack4.4_setup.sh
    $ sudo ./jetson_nano_jetpack4.4_setup.sh


##### RU:
##### Установка ОС JetPack на Jetson Nano. Linux OS.
<a id='ru_manual'></a>

Минимальный объем памяти для microSD: 32Gb. Для тестов хватит и 16Gb, однако практически все место будет занято системой.
Минимальный класс microSD для стабильной работы : 10.

1. Подключить microSD в компьютер, утилитой мониторинга файловых систем локализовать microSD:
     
         $ df -Th   

Флаг T выведет информацию о типе файловой системы.
Флаг h представит данные в читаемом табличном виде в терминале.

Найти адрес карты: /dev/sd<x>

Если microSD не найдена, можно также воспользоваться утилитами:

    $ sudo gnome-disks
    $ sudo gparted
    $ sudo parted -l

Подробнее о df: https://ru.wikipedia.org/wiki/Df

2. Скачать образ для Jetson Nano jetson-nano-developer-kit-sd-card-image.zip можно с официального сайта https://developer.nvidia.com/embedded/jetpack. Также ссылку на последний образ для Jetson Nano можно скачать с официальной страницы следующего мануала:
https://developer.nvidia.com/embedded/learn/get-started-jetson-nano-devkit#write

3. Записать образ полученной системы:

        $ /usr/bin/unzip -p ~/Downloads/jetson-nano-developer-kit-sd-card-image.zip | sudo /bin/dd of=/dev/sd<x> bs=1M status=progress

где /dev/sd<x> - найденный адрес подключенной microSD с помощью команды $df -Th.

---
    Например, для обнаруженного /dev/sdb1      vfat       30G   32K   30G   1% /media/alexander/9016-4EF8:
    /usr/bin/unzip -p ~/Downloads/jetson-nano-developer-kit-sd-card-image.zip | sudo /bin/dd of=/dev/sdb bs=1M status=progress
---

Важно, чтобы запись шла на сам диск, а не его партицию: /dev/sdb1 - партиция, /dev/sdb - диск. При записи на партицию не будет выдано никаких комментариев, при этом bootloader не сможет запустить систему.

Если образ не упакован в архив (формат .img), достаточно ввести:

    $ sudo umount /dev/sd<x>
    $ sudo dd if=~/Downloads/image.img  of=/dev/sdb bs=1M status=progress

Альтернативная установка: с помощью GUI-интерфейса с утилитой для прошивки устройств balenaEtcher.

4. Извлечь microSD карту после загрузки:
                
       $ sudo eject /dev/sd<x>

---
Если нет Wifi-USB модуля для подключения к сети, можно провести сетевой мост, например, в связке с другим Linux через Ethernet.
Для этого можно воспользоваться утилитой nm-connection editor в терминале.
Для донора сети в появившемся окне во вкладке IPv4 Settings выбрать Method: Shared to other computers.
Для вступления в силу сетевого моста переподключить соединение Ethernet на рецепиенте.
---

Для полной настройки Jetson-устройства после установки OS: (OpenCV&CUDA, Tensorflow 2.2, DeepStream 5)

Скачать с официального сайта https://developer.nvidia.com/deepstream-getting-started инсталлятор DeepStream 5.x.x for Jetson в директорию 
    
    ~/<your_path>/nvidia_jetson/jetso_nano. 

Переименовать инсталлятор в стандартное имя для автоматической установки: 
    
    $ mv deepstream-5.x.x_arm64.deb deepstream_arm64.deb
    
Запустить установщик:

    $ cd ~/<your_path>/nvidia_jetson/jetso_nano
    $ chmod +x ./jetson_nano_jetpack4.4_setup.sh
    $ sudo ./jetson_nano_jetpack4.4_setup.sh
    
    
[Back to Content](#start)