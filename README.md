# jukebox

jukebox is a fork of [radio](https://github.com/bacwyls/radio) that makes use of the uqbar testnet.

to avoid dependency issues, jukebox agents are prefixed with 'pay', (tower->paytower, tenna->paytenna).

navigation, discovery, and self-hosted stations were removed in favor of one public station. 
this station (The Jukebox) is a piece of data on-chain containing a media URL, a timestamp, and the author (wallet pubkey)

presence and chat are taken from radio, using a central server on ~bacdun-nodmyn-dosrux.


users can participate in jukebox without having ziggurat installed, but they cant !tip or !play.

