
There is a detailed manual on Medium about Desktop sharing: [Link](https://medium.com/@bharathsudharsan023/jetson-nano-remote-vnc-access-d1e71c82492b)

To configure desktop sharing you can make several steps:

1. Make the Desktop Sharing application work normal

`$ sudo vim /usr/share/glib-2.0/schemas/org.gnome.Vino.gschema.xml`
   
Add the following key into the opened XML file in vim.

    <key name='enabled' type='b'>
    <summary>Enable remote access to the desktop</summary>
    <description>
    If true, allows remote access to the desktop via the RFB
    protocol. Users on remote machines may then connect to the
    desktop using a VNC viewer.
    </description>
    <default>true</default>
    </key>

2. Compile the schemas:

`$ sudo glib-compile-schemas /usr/share/glib-2.0/schemas`


3. Add VNC server on startup:

Open ‘startup applications’. Click Add at the right of the box, then type ‘Vino’ in the name box, 
and then in the command box enter `/usr/lib/vino/vino-server`.
Click Save at the bottom right of the box, and then close the app.

4. Disable VNC encryption:

`$ gsettings set org.gnome.Vino require-encryption false`

`$ gsettings set org.gnome.Vino prompt-enabled false`  

Add `xrandr --fb wxh` to `~/.bashrc`, where w, h - your desired resolution for a remote desktop (1920x1080, for example).
Set `login automatically` without password for headless start in Ubuntu Settings. Reboot the device.


5. Check that VNC is working after reboot:

`$ ps -ef|grep vnc`

6. On a host computer use any VNC viewer. For example, Remmina.

