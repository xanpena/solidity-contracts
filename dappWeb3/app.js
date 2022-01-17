require('dotenv').config()

const Web3 = require('web3')
const EthereumTx = require('ethereumjs-tx')

const web3 = new Web3(process.env.NODE_INFURA)

const address1 = process.env.ADDRESS1
const address2 = process.env.ADDRESS2

const address1Key = new Buffer.from(process.env.ADDRESS1_KEY)
const address2Key = new Buffer.from(process.env.ADDRESS2_KEY)

web3.eth.getBalance(address1, (err, balance) => {
    console.log(web3.utils.fromWei(balance, 'ether'))
})

web3.eth.getBalance(address2, (err, balance) => {
    console.log(web3.utils.fromWei(balance, 'ether'))
})