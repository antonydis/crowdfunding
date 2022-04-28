// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// Create a crowdfunding contract
contract CrowdFunding {
    //Create an enum for the different states of the contract
    enum FundraisingState {
        Opened,
        Closed
    }
    //Create a struct for the contributors
    struct Contribution {
        address contributor;
        uint256 value;
    }
    // Create a struct to hold the details of a single campaign
    struct Project {
        string id;
        string name;
        string description;
        address payable author;
        FundraisingState state;
        uint256 funds;
        uint256 fundraisingGoal;
    }

    Project[] public projects;
    // Create a mapping of the projects using an array of string as the key
    mapping(string => Contribution[]) public contributions;

    // Event to create new projects
    event ProjectCreated(
        string projectId,
        string name,
        string description,
        uint256 fundraisingGoal
    );
    // Event to notify that the project has been funded
    event ProjectFunded(string projectId, uint256 value);
    // Event to notify that the project has been changed
    event ProjectStateChanged(string id, FundraisingState state);

    // Modifier to only the owner can change the state of the project
    modifier isAuthor(uint256 projectIndex) {
        require(
            projects[projectIndex].author == msg.sender,
            "You need to be the project author"
        );
        _;
    }
    // Modifier to evit that an author can apport to their own project
    modifier isNotAuthor(uint256 projectIndex) {
        require(
            projects[projectIndex].author != msg.sender,
            "As author you can not fund your own project"
        );
        _;
    }
    // Create a function to create a new project
    function createProject(
        string calldata id,
        string calldata name,
        string calldata description,
        uint256 fundraisingGoal
    ) public {
        require(fundraisingGoal > 0, "fundraising goal must be greater than 0");
        Project memory project = Project(
            id,
            name,
            description,
            payable(msg.sender),
            FundraisingState.Opened,
            0,
            fundraisingGoal
        );
        projects.push(project);
        emit ProjectCreated(id, name, description, fundraisingGoal);
    }
    // Function to check if fundProject is called by the author
    function fundProject(uint256 projectIndex)
        public
        payable
        isNotAuthor(projectIndex)
    {
        Project memory project = projects[projectIndex];
        require(
            project.state != FundraisingState.Closed,
            "The project can not receive funds"
        );
        require(msg.value > 0, "Fund value must be greater than 0");
        project.author.transfer(msg.value);
        project.funds += msg.value;
        projects[projectIndex] = project;

        contributions[project.id].push(Contribution(msg.sender, msg.value));

        emit ProjectFunded(project.id, msg.value);
    }
    // Function to change the state of the project
    function changeProjectState(FundraisingState newState, uint256 projectIndex)
        public
        isAuthor(projectIndex)
    {
        Project memory project = projects[projectIndex];
        require(project.state != newState, "New state must be different");
        project.state = newState;
        projects[projectIndex] = project;
        emit ProjectStateChanged(project.id, newState);
    }
}
