require(sodium)
# See https://cran.r-project.org/web/packages/sodium/vignettes/intro.html

## Create a secret passphrase. You can share this with anyone
## you like, so they can decrypt the data
key_string = "This is a secret passphrase"
key = hash(charToRaw(key_string))

## Read the data and serialize it to prepare it for encryption
## The file is taken from here:
## https://github.com/richarddmorey/absoluteJudgmentCalibration/tree/master/data
## You can replace with your own local file
dat = read.table("https://github.com/richarddmorey/absoluteJudgmentCalibration/blob/master/data/exp1.txt?raw=true")
msg = serialize(dat, NULL)

## Create a nonce file to be shared with the encrypted file
nonce <- random(24)

## In order to prevent accidentally overwriting the nonce,
## check it
if(!file.exists("nonce")){
  
  ## Save the nonce; if you're encrypting a new file,
  ## you'll want a new nonce. 
  write(nonce, file = "nonce")
  
  ## encrypt the data
  cipher <- data_encrypt(msg, key, nonce)
  
  ## Save the encrypted data, which you can then save
  ## to an OSF project or GitHub repository
  saveRDS(cipher, file = "exp1_encrypted.rds")
  
}else{
  stop("nonce file exists. Not overwriting nonce or data.")
}

########
## Check to make sure encryption worked

rm("nonce","cipher","msg","key")

## Hash the key 
key = hash(charToRaw(key_string))

## Read in the nonce
nonce_char = scan("nonce", what = "character")
nonce = hex2bin(paste(nonce_char, collapse = ""))

cipher = readRDS("exp1_encrypted.rds")
s_dat = data_decrypt(cipher, key, nonce)
exp1 = unserialize(s_dat)

stopifnot(identical(exp1, dat))
