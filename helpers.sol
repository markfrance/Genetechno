pragma solidity ^0.4.19;

import "./technocollab.sol";

contract TechnoHelper is TechnoCollab {

  modifier aboveLevel(uint _level, uint _trackId) {
    require(tracks[_tracksId].level >= _level);
    _;
  }

  function changeTrackName(uint _trackId, string _newName) external aboveLevel(2, _trackId) {
    require(msg.sender == trackToProducer[_trackId]);
    tracks[_trackId].name = _newName;
  }

  function changeDna(uint _trackId, uint _newDna) external aboveLevel(20, _trackId) {
    require(msg.sender == trackToProducer[_trackId]);
    tracks[_trackId].dna = _newDna;
  }

  function getTracksByProducer(address _producer) external view returns(uint[]) {
    uint[] memory result = new uint[](producerTrackCount[_producer]);
    uint counter = 0;
    for(uint i=0; i<tracks.length;i++){
       if(tracksToProducer[i] == _producer){
          result[counter] = i;
          counter++;
    }
    }
	
    return result;
  }

}
