pragma solidity ^0.4.19;

import "./trackfactory.sol";

contract TrackCollab is TrackFactory {

  function collaborate(uint _trackId, uint _targetDna) public {
    require(msg.sender == trackToProducer[_trackId]);
    Track storage myTrack = tracks[_trackId];
    _targetDna = _targetDna % dnaModulus;
    uint newDna = (myTrack.dna + _targetDna) / 2;
    
    _createTrack("Untitled", newDna);
  }

}