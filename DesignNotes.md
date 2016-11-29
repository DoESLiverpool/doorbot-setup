# DoES Liverpool Electronic Locking System

## Live System

There is a system currently live built on Raspberry Pi, this is not the final design but is enough to keep us going. More information on DoorBot page.

## Future Plans

This page contains some information about the electronic locking system for DoES Liverpool. This system is currently in the planning stages.

### Specifications

 * Computer can open door
  * Should fail locked
  * Can be opened by local RFID scan
  * Can be opened by a webpage which requires you to be on the local internet
  * Can be opened by administrators through other methods (SSH, doesbot, etc.)
 * RFID scan works offline (regularly downloads RFID details locally, or they're just stored there anyway)
 * Doorbell sends messages to IRC, twitter, etc. (and rings)
 * Failed RFID scan should cause a noise
 * Successful RFID scan should cause a noise, most likely the user's ringtone
 * For later:
  * Doorbot should show a message on the screen

Required materials might be:
 * Power for each unit with enough ampage to power all of the electronics
 * Control System
  * 2 x Raspberry Pi, provides network access, controls the electronics and hosts the USB RFID readers
  * 2 x Tikitag style RFID reader or [http://www.skpang.co.uk/catalog/hf-rfid-module-sl031-33v-uart-p-1066.html SL031]
 * Door System
  * Fail-locked Dorcas lock
  * Reed-switch to detect door open/closed state
 * Audio System
  * Speakers
  * Amplification
 * Door Bell

