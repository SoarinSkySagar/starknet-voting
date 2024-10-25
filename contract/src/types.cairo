#[derive(Copy, Drop, Serde, starknet::Store)]
pub struct Poll {
    candidates: Map::<u32, Candidate>,
    total_votes: u32,
    lead: Candidate
}

#[derive(Copy, Drop, Serde, starknet::Store)]
pub struct Candidate {
    name: felt252,
    image: u32,
    votes: u32
}
