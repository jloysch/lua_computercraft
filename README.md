# lua_computercraft
ComputerCraft Programs Written in LUA

DESCRIPTIONS:

* alarm_monitor - made for the badge_client program.
* badge_client - a method for using floppy disks for authentication. The request is sent over rednet to a authentication / intermediate computers in my current computer room setup.
* auth - the program that runs on my authentication server computer in the computer room, this computer tells the other computer to open or not.
* badge_writer - writes a permissible badge that'll work with the badges. (NOT INCLUDED: TBW / Table Writer + ETC - Can change multiple properties on the fly while hotswapping since decentralizing)
* b2eread + b2ewrite - experimental badge writing program, more complex
* clientstartup - the startup program for any client computer. Computers need not be programmed, they just need to have a file which specifies which program it shold run and *there is only one copy of the program that needs to be maintained!*
  ALL PROGRAMS COME FROM THE PROGRAMS SERVER!
* dynprog - the dynamic programs server program. This allows rapid setup of computers and makes it much easier to maintain programs across computers. So far I have about 30 computers requesting programs at the same time
  and the server is able to serve all of them, I have a desynchronaztion algorithm embedded in the getprog for the client computers to descynchronize the lua threads and unblock each computer. 
* control - controller computer program, can pass remote shells and controls which servers can talk to each other. Basically while any server is running we can shell into it and manage it remotely. 
* cycler - simple on/off program
* diskLabeler - simple disk labeler program that saves a minute
* dns - dns server, gets request from computers, checks a table to see if the computers are registered, then routes them appropriately (see register())
* getprog - the client side of the programs server. This has the desync embedded. This gets programs from the programs server on the client computers.
* progvar - externalized the properties of the program for rapid setup of new computers. (Virtualized facility setting in Tekkit Classic)
* remoteboot - simple remote booter program, only works on one computer to send remote reboots to destick. Runs in the secured area in the computer room.
* rsh - remote shell program to allow shells to run on the computers while they perform their functions, can remotely do operations on the client or server computers with appropriate use.
* test_flow - program to measure eu/t programatically using computercraft. There was no way to do this with a computer but I have figured out a way to measure eu/t waiting for a redstone signal from an MFSU and timing it.
* tim - simple messenger program for certain computers to debug / destick. Reserved computer ID.


