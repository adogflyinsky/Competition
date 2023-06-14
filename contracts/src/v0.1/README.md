# Usage

- [PrizeToken](PrizeToken.sol) and [CompetitionToken](CompetitionToken.sol) represent prize competitions and competition ID respectively.

- [Prize](Prize.sol) is used to set informations what should be available before starting competition, such as amount of PrizeToken and prize ratio. Besides, prize is assigned to any competition with specific competition id. At the end of competition, winning participants will receive their respective prizes.

- [QuestionSetV1](QuestionSetV1.sol) generates enough questions for the participants based on the number of participants. With a given index of the participant corresponding to a certain question, the participant will use the result found and combine it with the question to create a proof.
In version 1, proof with probability 1/20 and no customizations set to increase complexity. In the next version, it is possible to customize the probability and increase the complexity by running more loops so that the proof can be generated.

- [CompetitionBase](CompetitionBase.sol) is basic operations to organize the contest.<br>
**Standout feature**: Instead of entering the results directly, participants will fill in data to prove they know the results. After they fill in the data, the participant information is pushed to a list of participants who answered with new data encoded into: address, index (used to generate question) and data. Based on that list of encoded data, the competition will get winners who answered correctly and the order of the winners accordingly.

- [CompetitionV0](CompetitionV0.sol) combines [CompetitionBase](CompetitionBase.sol), [QuestionSetV1](QuestionSetV1.sol), [Prize](Prize.sol) and [CompetitionToken](CompetitionToken.sol) together. 

- [CompetitionV1](CompetitionV1.sol) adds the way to fill result to create a complete competition contract.
