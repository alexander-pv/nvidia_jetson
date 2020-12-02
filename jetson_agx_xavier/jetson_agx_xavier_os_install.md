

##### Installing JetPack on Jetson AGX Xavier.
<a id='en_manual'></a>

To install OS on Jetson AGX Xavier you can use NVIDIA SDK manager.
The recent version of JetPack: 4.4.1
Note, that for now NVIDIA SDK manager supports only Ubuntu 16.04 and 18.04 on x64 system.

See documentation about sdkmanager here:
 * [SDK Manager](https://docs.nvidia.com/sdk-manager/download-run-sdkm/index.html)
 * [JetPack installation](https://docs.nvidia.com/sdk-manager/install-with-sdkm-jetson/index.html)

See full documentation about AGX Xavier here: [AGX Xavier documentation](https://developer.download.nvidia.com/assets/embedded/secure/jetson/xavier/docs/jetson_agx_xavier_developer_kit_user_guide.pdf?BazwSwefUlMIyfXfRWj2LNZ2CJY8HFrdAU4jvNJgIuBZZV3dmpVgY6N_EwtsG8_axtiID_AotgCKkpeMiCsiVdWwCGPGH-z2_OtqDA_nBMbUOmP_WbOmUxHlNRTPYU4OJ8Ptv0owJFUlgqOL_TjCogUlwj0rlM9sCAgAGO9qkVukhkiaV8yO3mS2qdhbqPgfudp70M4bCg)

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

4.You may want to update your system and install OpenCV&CUDA, tensorflow library.
   To do this you may run the following:
   
    $ cd ~/<your_path>/nvidia_jetson/jetson_agx_xavier
    $ chmod +x ./jetson_agx_xavier_jetpack4.4.1_setup.sh
    $ sudo ./jetson_agx_xavier_jetpack4.4.1_setup.sh

