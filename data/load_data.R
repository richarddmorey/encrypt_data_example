require(sodium)
# See https://cran.r-project.org/web/packages/sodium/vignettes/intro.html

## When you're ready to share, just release the correct passphrase
## in the load_data.R script. Alternatively, you could load 
## this from a local file that you later share others.
key_string = "This is a secret passphrase"

## Hash the key (as when encrypted)
key = hash(charToRaw(key_string))

## Read in the nonce from GitHub
nonce_char = scan("https://github.com/richarddmorey/encrypt_data_example/blob/master/data/nonce?raw=true", what = "character")
## Read in the nonce from OSF
# nonce_char = scan("https://osf.io/n6k4z/download?version=1", what = "character")
nonce = hex2bin(paste(nonce_char, collapse = ""))

## Read encrypted data from GitHub
gh_con = url("https://github.com/richarddmorey/encrypt_data_example/blob/master/data/exp1_encrypted.rds?raw=true")
cipher = readRDS(gzcon(gh_con))
close(gh_con)
## Read encrypted data from OSF
# osf_con = url("https://osf.io/2k84f/download?version=1")
# cipher = readRDS(gzcon(osf_con))
# close(osf_con)


## Decrypt and unserialize
s_dat = data_decrypt(cipher, key, nonce)
exp1 = unserialize(s_dat)
