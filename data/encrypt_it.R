require(sodium)
# See https://cran.r-project.org/web/packages/sodium/vignettes/intro.html

## Create a secret passphrase. You can share this with anyone
## you like, so they can decrypt the data
key_string = "This is a secret passphrase"
key = hash(charToRaw(key_string))

## Read the data and serialize it to prepare it for encryption
dat = read.table("exp1.txt")
msg = serialize(dat, NULL)

## Create a nonce file to be shared with the encrypted file
nonce <- random(24)

## In order to prevent accidentally overwriting the nonce,
## check it
if(!file.exists("nonce")){
  
  ## save the nonce
  write(nonce, file = "nonce")
  
  ## encrypt the data
  cipher <- data_encrypt(msg, key, nonce)
  
  ## save the encrypted data
  saveRDS(cipher, file = "exp1_encrypted.rds")
  
}else{
  stop("nonce file exists. Not overwriting nonce or data.")
}


