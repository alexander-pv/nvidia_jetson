
#### Content:

* [EN manual](#en_manual)
* [RU manual](#ru_manual)


<a id='en_manual'></a>
##### Manual for cloning a microSD image for arm64

##### Image cloning

1. Connect microSD to your computer, use the file system monitoring utility to localize microSD:
        
        $ df -Th

The T flag displays information about the file system type.
The h flag will present data in a readable mtable form in the terminal.

Find the address of the card: /dev/sd<x>

If the microSD is not found, you can also use the utilities:

    $ sudo gnome-disks
    $ sudo gparted
    $ sudo parted -l

Learn more about df: https://ru.wikipedia.org/wiki/Df

For example, there is a device at /dev/sd<x>

Important. The number at the end of the device address is the disk partition. You need to work with the entire disk, because you need to copy all partitions to the new microSD.


    2. $ sudo umount /dev/sd<x>
    
    
    3. $ sudo dd if=/dev/sd<x> conv=sync,noerror bs=64K | gzip -c > ~/backup_image.img.gz status=progress

bs - block size, larger block size, faster copying.

noerror - ignores read errors.

sync - filling blocks with zeros in case of read errors.

Copying can take from 30 minutes to more than one hour, depending on the size of the disk and the amount of information recorded on it.

Example of a copy result in the terminal:

    488448+0 records in
    488448+0 records out
    32010928128 bytes (32 GB, 30 GiB) copied, 1891,54 s, 16,9 MB/s


##### Transferring the created image

    $ sudo su
    $ sudo umount /dev/sd<x>
    $ gunzip -c ~/backup_image.img.gz | dd of=/dev/sd<x> bs=64K status=progress

If you are transferring to a larger map, then you can use resize2fs.

    Attention. Transferring an image to a card from another manufacturer may not be successful.
    Tested: Samsung EVO 32Gb and the Transcend 32Gb.


---
  

<a id='ru_manual'></a>
##### Инструкция по созданию образа microSD для arm64

##### Создание образа

1. Подключить microSD в компьютер, утилитой мониторинга файловых систем локализовать microSD:
                
         $ df -Th   

Флаг T выведет информацию о типе файловой системы.
Флаг h представит данные в читаемом мтабличном виде в терминале.

Найти адрес карты: /dev/sd<x>

Если microSD не найдена, можно также воспользоваться утилитами:

    $ sudo gnome-disks
    $ sudo gparted
    $ sudo parted -l

Подробнее о df: https://ru.wikipedia.org/wiki/Df

Например, имеется девайс по адресу  /dev/sd<x>

Важно. Цифра на конце адреса девайса - это партиция диска. Необходимо работать со всем диском, поскольку необходимо скопировать все партиции на новую microSD.


    2. $ sudo umount /dev/sd<x>


    3. $ sudo dd if=/dev/sd<x> conv=sync,noerror bs=64K | gzip -c > ~/backup_image.img.gz status=progress

bs - размер блока, больше размер блока, быстрее копирование.

noerror - игнорирование ошибок чтения.

sync - заполнение блоков нулями в случае ошибок чтения.

Копирование может занимать от 30 мин до более одного часа в зависимости от объема диска и объема записанной на нем информации.

Пример результата копирования в терминале:
    
    488448+0 records in
    488448+0 records out
    32010928128 bytes (32 GB, 30 GiB) copied, 1891,54 s, 16,9 MB/s


##### Перенос созданного образа
    
    $ sudo su
    $ sudo umount /dev/sd<x>
    $ gunzip -c ~/backup_image.img.gz | dd of=/dev/sd<x> bs=64K status=progress

Если идет перенос на карту большего размера, после можно воспользоваться  resize2fs.
    
    Внимание. Перенос образа на карту другого производителя может быть неуспешен.
    Тестировались: Samsung EVO 32Gb и Transcend 32Gb.
