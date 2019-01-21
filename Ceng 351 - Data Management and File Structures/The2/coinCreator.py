# -*- coding: utf-8 -*-

# engin : 10.12.2017
# CengCoinExchange!

import sys

import argparse
import random

parser = argparse.ArgumentParser()
parser.add_argument("--coinCount", help="Specify the number of coins.", type=int, default=10)
parser.add_argument("--fileName", help="File name to output.", type=str, default="coins_default.txt")
parser.add_argument("--argument", help="list (for GUI) or add (for console)", default="list")
args = parser.parse_args()

if args.fileName == "coins_default.txt":
	args.fileName = "coins_%d.txt" % args.coinCount

allCoins = []

coinNames = ["Bitcoin", "Ethereum", "Bitcoin Cash", "IOTA", "Ripple", "Litecoin", "IOTA", "Cardano", "Dash", "NEM", "Monero", 
"Bitcoin Gold", "EOS", "Stellar", "NEO", "Qtum", "Ethereum Classic", "TRON", "Lisk", "BitConnect", "Verge", "Zcash", "Populous",
"Tether", "BitShares", "Hshare", "Waves", "OmiseGO", "Nxt", "Komodo", "Ardor", "Stratis", "Bytecoin", "Veritaserum", "MonaCoin",
"Augur", "Steem", "Dogecoin", "Ark", "Siacoin", "RaiBlocks", "Decred", "Status", "Electroneum", "PIVX", "SALT", "Binance Coin", 
"Golem", "DigiByte", "VeChain", "BitcoinDark", "Bytom", "Byteball Bytes", "Walton", "Power Ledger", "TenX", "Vertcoin", "Basic Attention Token",
"MaidSafeCoin", "QASH", "ZCoin", "Kyber Network", "Aeternity", "DigixDAO", "Factom", "Syscoin", "Santiment Network Token", "Ox", "Gas",
"Aion", "GameCredits", "Dragonchain", "Cryptonex", "GXShares", "FunFair", "Decentraland", "Einsteinium", "Iconomi", "Ethos", "ReddCoin",
"Nexus", "BitBay", "Civic", "Gnosis", "Raiden Network Token", "Monaco", "Bancor", "Request Network", "Metal", "Time New Bank", "Blocknet",
"Streamr DATAcoin", "Agoras Token", "PayPie", "ChainLink", "Storj", "RChain", "Asch", "NAV Coin", "Substratum", "Groestlcoin"]
currencyNames = ["₺", "$", "€"]

values = ["%d" % (i) for i in range(1000)]

delimiter = "|"

with open(args.fileName, "w") as outputFile:
	for i in range(args.coinCount):
		name = random.choice(coinNames)
		value = random.choice(values)
		currency = random.choice(currencyNames)

		coinString = args.argument + delimiter + str(i) + delimiter + name + delimiter + value + delimiter + currency + "\n"

		outputFile.write(coinString)

print "bubbleeee"
