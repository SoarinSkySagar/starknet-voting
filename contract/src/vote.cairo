#[starknet::contract]
mod VotingContract {
    use core::starknet::{ContractAddress, get_caller_address};
    use core::starknet::storage::{
        Map, StoragePathEntry, StoragePointerReadAccess, StoragePointerWriteAccess
    };
    use contract::types::{Candidate, Poll};

    #[storage]
    struct Storage {
        owner: ContractAddress,
        polls: Map::<u32, Poll>,
    }


    #[constructor]
    fn constructor(ref self: ContractState, owner_address: ContractAddress) {
        self.owner.write(owner_address);
    }

    #[abi(embed_v0)]
    impl IVotingContractImpl of super::IVotingContract<ContractState> {
        fn vote(ref self: ContractState, poll: u32, candidate: u32) -> bool {}

        fn get_votes(self: @ContractState, poll: u32, candidate: u32) -> u32 {}

        fn get_winner(self: @ContractState, poll: u32) -> Candidate {}

        fn create_poll(ref self: ContractState, candidates: Vec<Candidate>) -> Poll {}

        fn get_total_votes(self: @ContractState, poll: u32) -> u32 {}

        fn get_poll(self: @ContractState, poll_id: u32) -> Poll {}
    }

    #[external(v0)]
    fn get_contract_name(self: @ContractState) -> felt252 {
        'Voting Contract @SoarinSkySagar'
    }
}

