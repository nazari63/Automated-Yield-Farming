// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IYieldFarm {
    function deposit(uint256 amount) external;
    function withdraw(uint256 amount) external;
    function claimRewards() external;
}

contract AutomatedYieldFarming {
    address public admin;
    IYieldFarm public yieldFarm;

    event Staked(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event RewardsClaimed(address indexed user, uint256 reward);

    constructor(address _yieldFarm) {
        admin = msg.sender;
        yieldFarm = IYieldFarm(_yieldFarm);
    }

    function stake(uint256 amount) external {
        yieldFarm.deposit(amount);
        emit Staked(msg.sender, amount);
    }

    function withdraw(uint256 amount) external {
        yieldFarm.withdraw(amount);
        emit Withdrawn(msg.sender, amount);
    }

    function claimRewards() external {
        yieldFarm.claimRewards();
        emit RewardsClaimed(msg.sender, 0);  // Replace 0 with actual reward amount when implemented
    }
}