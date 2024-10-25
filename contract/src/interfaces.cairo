use contract::types::{Candidate, Poll};

#[starknet::interface]
pub trait IVotingContract<TContractState> {
    fn vote(ref self: TContractState, poll: u32, candidate: u32) -> bool;
    fn get_votes(self: @TContractState, poll: u32, candidate: u32) -> u32;
    fn get_winner(self: @TContractState, poll: u32) -> Candidate;
    fn create_poll(ref self: TContractState, candidates: Vec<Candidate>) -> Poll;
    fn get_total_votes(self: @TContractState, poll: u32) -> u32;
    fn get_poll(self: @TContractState, poll_id: u32) -> Poll;
}
