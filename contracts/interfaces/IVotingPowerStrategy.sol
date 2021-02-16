// SPDX-License-Identifier: agpl-3.0
pragma solidity 0.7.5;
pragma abicoder v2;

interface IVotingPowerStrategy {
    function handleProposalCreation(
      uint256 proposalID,
      uint256 startTimestamp,
      uint256 endTimestamp
    ) external;

    function handleProposalCancellation(uint256 proposalID) external;
 
    /// @params choice: unused params (for furture use)
    /// call to init data if needed, and return voter's voting power
    function handleVote(
      address voter,
      uint256 proposalID,
      uint256 choice
    ) external returns(uint256 votingPower);

    function handleWithdraw(address user, uint256 reduceAmount) external;

    /// call to get voter's voting power given timestamp, should use for reading purpose
    /// when submitVote, should call handleVote instead
    function getVotingPower(
      address voter,
      uint256 proposalID,
      uint256 timestamp
    ) external view returns(uint256 votingPower);

    /// pass creator in case we want to validate if creator has enough quorum to create proposal
    function validateProposalCreation(
      address creator,
      uint256 startTimestamp,
      uint256 endTimestamp
    ) external view returns (bool);

    /// we could have a function to validate if sender has enough quorum to cancel
    /// but not necessary at this phase
}
