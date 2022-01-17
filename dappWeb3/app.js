require('dotenv').config()

const Web3 = require('web3')
const EthereumTx = require('ethereumjs-tx')

const web3 = new Web3(process.env.NODE_INFURA)

const address1 = process.env.ADDRESS1
const address2 = process.env.ADDRESS2

const address1Key = new Buffer.from(process.env.ADDRESS1_KEY, 'hex')
const address2Key = new Buffer.from(process.env.ADDRESS2_KEY, 'hex')

web3.eth.getBalance(address1, (err, balance) => {
    console.log(web3.utils.fromWei(balance, 'ether'))
})

web3.eth.getTransactionCount(address1, (err, txCount) => {
    let rawTx = {
        nonce: web3.utils.toHex(txCount),
        gasPrice: web3.utils.toHex(web3.utils.toWei('2', gwei)),
        gasLimit: web3.utils.toHex(21000),
        to: address2,
        value: web3.utils.toHex(8000000000000000000)
    }

    let tx = new EthereumTx(rawTx)
    tx.sign(address2Key)

    serializedTx = tx.serialize().toString('hex')

    web3.eth.sendSignedTransaction('0x' + serializedTx).on('receipt', console.log)
})