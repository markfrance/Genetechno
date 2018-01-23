pragma solidity ^0.4.19;

import "./ownable.sol";

contract TrackFactory is Ownable {

    event NewTrack(uint trackId, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    uint cooldownTime = 1 days;

    struct Track {
      string name;
      uint dna;
      uint32 level;
      uint32 readyTime;
    }

    Track[] public tracks;

    mapping (uint => address) public trackToProducer;
    mapping (address => uint) producerTrackCount;

    function _createTrack(string _name, uint _dna) internal {
        uint id = tracks.push(Track(_name, _dna, 1, uint32(now + cooldownTime))) - 1;
        trackToProducer[id] = msg.sender;
        producerTrackCount[msg.sender]++;
        NewTrack(id, _name, _dna);
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
        return rand % dnaModulus;
    }

    function createRandomTrack(string _name) public {
        require(producerTrackCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
        randDna = randDna - randDna % 100;
        _createTrack(_name, randDna);
    }

}
