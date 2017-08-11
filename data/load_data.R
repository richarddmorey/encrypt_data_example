require(sodium)
# See https://cran.r-project.org/web/packages/sodium/vignettes/intro.html

# Do everything in an evironment to keep global_env clean
enc_environ = new.env()
enc_environ$key_string = key_string

evalq(envir = enc_environ, 
{
  
  ## Hash the key (as when encrypted)
  key = hash(charToRaw(key_string))
  
  ## Read in the nonce from GitHub
  nonce_char = scan("https://github.com/richarddmorey/encrypt_data_example/blob/master/data/nonce?raw=true", what = "character")
  nonce = hex2bin(paste(nonce_char, collapse = ""))
  
  ## Read encrypted data from GitHub
  gh_con = url("https://github.com/richarddmorey/encrypt_data_example/blob/master/data/exp1_encrypted.rds?raw=true")
  cipher = readRDS(gzcon(gh_con))
  close(gh_con)
  
  ## Decrypt and unserialize
  s_dat = data_decrypt(cipher, key, nonce)
  exp1 = unserialize(s_dat)
  NULL

})

# Read data from environment
exp1 = enc_environ$exp1

# Delete environment; no longer needed
rm(enc_environ)

