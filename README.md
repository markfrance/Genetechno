# Genetechno
Generative music techno collaboration game running on the Ethereum blockchain.
Written in Solidity for smart contract, JavaScript for front end.

The player (Producer) initially creates a randomly generated track represented as a 16 digit integer. 
This integer is split into 8 parts representing audio channels. The 2 digit number for each channel represents a variation of an audio loop for that channel.
e.g. 6423745409223973 = 64 - kick, 23 - hats, 74 - clap, 54 - snare, 09 - synth etc... 

A producer can listen to other producers tracks and collaborate with any other producer once per day. The track will be mutated by taking the average of both of the tracks 16 digit representation. 

The loop database will be arranged in a way that loop id numbers close to each other will sound most similar. This way, when collaborating with another producer on a track, it will take similar elements from both tracks while creating a completely new track.

A history of previous collaborations will be stored, and allows renaming of tracks.
A simple color image based on the track 16 digit int will be used for the centre of the track's vinyl record and play button.

Eventually producers will be able to trade their creations with other users.
