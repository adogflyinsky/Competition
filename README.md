# Competition with Web3

### 1. Introduction
- A competition has participants and result. 
- In the competition, each participant tries to find the result and doesn't want to others to know his result but has to prove that he knows the result. 
- Result should only be revealed when the competition is over. 

### 2. Zero Knowledge Proof
Instead of filling result directly, you fill in data that can prove not only the competition but participants that you know result. However, the requirement is that it is very difficult (depending on 
many factors, such as probability, complexity,...) for other participants to trace back result from the data. 

### 3. Smart contracts
The participants ensure that if the competition organizer correctly reports the results, the participant who fills in the correct data will receive the correct rank and prize as announced.
Move to [folder](./contracts) to know how it works. 
