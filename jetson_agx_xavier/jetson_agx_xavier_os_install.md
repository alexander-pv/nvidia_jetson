

##### Installing JetPack on Jetson AGX Xavier.
<a id='en_manual'></a>

To install OS on Jetson AGX Xavier you can use NVIDIA SDK manager.
Note, that for now NVIDIA SDK manager supports only Ubuntu 16.04 and 18.04 on x64 system.


See documentation about sdkmanager here:
 * [SDK Manager](https://docs.nvidia.com/sdk-manager/download-run-sdkm/index.html)
 * [JetPack installation](https://docs.nvidia.com/sdk-manager/install-with-sdkm-jetson/index.html)

See full documentation about AGX Xavier here: [AGX Xavier documentation](https://developer.download.nvidia.com/embedded/L4T/r32-3-1_Release_v1.0/jetson_agx_xavier_developer_kit_user_guide.pdf?_Z22bpSl3qyO-cDeiffPaTKT98b8ez-LEwS89GK4NVfwWNzFOkhtQ0SgLdi4Bt-m-yHfTHKXCL2dmitq44khUWzVUBBLkP31kJjwy6Gkkx_TAFBmJfBpAUG6tr_aTlPE_PUIU2eI1Optvu9APKRzuDDwb2PBH0YNi2_4HDxAfna-0LEGnF9sZwALC6I5lOE)

Steps:

1.Prepare your AGX Xavier device. Connect:
  * Power adapter
  * UCB C from the front side of the device to the computer
  * Mouse and keyboard with USB C on the rear side
  * Ethernet to the computer
  * Use HDMI to connect device to a monitor.
  
2.Turn the device on in a recovery mode: press power and force recovery buttons,
 wait for about 2 seconds and release buttons.
 
3.Open sdkmanager on the computer and follow the detailed instructions in sdkmanager documentation.
After flashing device you need to configure system and continue installing components 
with sdkmanager. Deepstream with samples will be already installed on the device.

Note, after OS flashing all the packages along with CUDA requires Internet on the flashed device. Make sure that
you are connected to the proper network (see ifconfig command) where Internet is available.\
For example, to share Internet via Ethernet you can open nm-connection-editor on host computer to enable Internet 
sharing via ipv4 settings to other computers like Jetson device. 
It is highly likely that on Jetson device the address for eth0 interface will be 10.42.0.xxx. 
So you can use it to install additional libraries via sdkmanager.

4.You may want to update your system and update/install:
   * OpenCV&CUDA,
   * tensorflow,
   * deepstream,

   To do this you may run the following:
   
    $ cd ~/<your_path>/nvidia_jetson/jetson_agx_xavier
    $ chmod +x ./jetson_agx_xavier_jetpack_setup.sh
    $ sudo ./jetson_agx_xavier_jetpack_4.x.x_setup.sh

    Available setups for JetPack in the repo: 4.4.1, 4.5.1(added deepstream installation and opencv fix)


