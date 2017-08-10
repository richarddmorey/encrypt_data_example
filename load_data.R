require(sodium)

## You can make this whatever you want, until you're ready to share
# key_string = ""

## When you're ready to share, just release the correct passphrase
## in the load_data script.
key_string = "This is a secret passphrase"

## Hash the key (as when encrypted)
key = hash(charToRaw(key_string))

## Read in the nonce
nonce_char = scan("nonce", what = "character")
nonce = hex2bin(paste(nonce_char, collapse = ""))

## Read locally
cipher = readRDS("exp1_encrypted.rds")
## Read from GitHub
# cipher = readRDS(url(""))

## Decrypt and unserialize
s_dat = data_decrypt(cipher, key, nonce)
exp1 = unserialize(s_dat)
