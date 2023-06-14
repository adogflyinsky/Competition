import { ethers, hardhatArguments } from 'hardhat';
import * as Config from './config';

async function main() {
    await Config.initConfig();
    const network = hardhatArguments.network ? hardhatArguments.network : 'dev';
    const [owner] = await ethers.getSigners();
    console.log('deploy from address: ', owner.address);

    const CompetitionToken = await ethers.getContractFactory("CompetitionToken");
    const competitionToken = await CompetitionToken.deploy("https://old.chesstempo.com/chess-problems/");
    Config.setConfig(network + '.CompetitionToken', competitionToken.address);

    const PrizeToken = await ethers.getContractFactory("PrizeToken");
    const prizeToken = await PrizeToken.deploy();
    Config.setConfig(network + '.PrizeToken', prizeToken.address);

    const Prize = await ethers.getContractFactory("Prize");
    const prize = await Prize.deploy(prizeToken.address);
    Config.setConfig(network + '.Prize', prize.address);

    const CustomMath = await ethers.getContractFactory("CustomMath");
    const customMath = await CustomMath.deploy();
    Config.setConfig(network + '.CustomMath', customMath.address);

    const QuestionSet = await ethers.getContractFactory("QuestionSetV1",
        {
            libraries: {
                CustomMath: customMath.address,
            }
        });
    const questionSet = await QuestionSet.deploy();
    Config.setConfig(network + '.QuestionSetV1', questionSet.address);

    const CompetitionV1 = await ethers.getContractFactory("CompetitionV1");
    const competitionV1 = await CompetitionV1.deploy
        (
            competitionToken.address,
            prize.address,
            questionSet.address
        );
    Config.setConfig(network + '.CompetitionV1', competitionV1.address);

    await Config.updateConfig();
}

main().then(() => process.exit(0))
    .catch(err => {
        console.error(err);
        process.exit(1);
    });
