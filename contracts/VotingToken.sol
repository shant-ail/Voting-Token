//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Voting is ERC20{

    //******************************************************************************************************************//
    //---------------------------------------------DECLARATIONS---------------------------------------------------------//
    //******************************************************************************************************************//

    //State Variable Declarations
    address owner;
    string[] candidateList = ["ABC","BCD","PQR","TUV","XYZ"];

    //Mapping Declarations
    mapping (uint => uint) public ElectionRecord; //To record the number of votes received by each candidate
    mapping (address => bool) public VoterRecord; //To record if a voter has already voted or not

    //******************************************************************************************************************//
    //---------------------------------------------Initialization-------------------------------------------------------//
    //******************************************************************************************************************//

    constructor() ERC20("VOTING","INV"){
        owner = msg.sender;
        _mint(owner, 15);
    }
    
    //******************************************************************************************************************//
    //-----------------------------------------------FUNCTIONS----------------------------------------------------------//
    //******************************************************************************************************************//

    //Function to issue a token to a voter
    function issueToken(address payable _voter) public{
        address voter = _voter;
        require(balanceOf(voter) == 0);
        transfer(voter, 1);
    }

    //Function to perform voting related tasks
    function vote(address _voter, uint _can) public returns(string memory){
        uint candidate = _can;
        address voter = _voter;
        
        require(balanceOf(voter) != 0, "You don't have any tokens to participate in the Election.");
        require(candidate >= 0 && candidate < 5, "You have made an invalid candidate selection!");
        require(VoterRecord[voter] != true, "You have already voted in this election");

        string memory name = candidateList[candidate];
        ElectionRecord[candidate] += 1;
        VoterRecord[voter] = true;

        return string.concat("Your vote for ",name," has been successfully recorded");
    } 

    //Function to declare the result of the elections
    function result() public view returns(string memory){
        require(msg.sender == owner, "Only the owner can call for Election Results");
        uint maxVotes = 0; //Number of max votes
        uint highestCan = 0; //Candidate with the highest votes
        
        for(uint i = 0; i < 5; i++){
            if(ElectionRecord[i] > maxVotes){
                maxVotes = ElectionRecord[i];
                highestCan = i;
            }
        }

        string memory winner = candidateList[highestCan];
        return string.concat("Candidate ",winner," has won the Elections!");
    }
}