use snforge_std::{declare, ContractClassTrait, DeclareResultTrait};

use testing_smart_contracts::voting_contract::{
    IVotingContractDispatcher, IVotingContractDispatcherTrait,
};

#[test]
fn call_and_invoke() {
    let contract = declare("VotingContract").unwrap().contract_class();

    let (contract_address, _) = contract.deploy(@array![]).unwrap();

    let dispatcher = IVotingContractDispatcher { contract_address };

    let (yes_votes, no_votes) = dispatcher.get_votes();
    assert_eq!(yes_votes, 0);
    assert_eq!(no_votes, 0);
}
