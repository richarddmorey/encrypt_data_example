## When you're ready to share, just release the correct passphrase
## Before you're ready to share, you could load 
## this from a local file that you later share others.
key_string = "This is a secret passphrase"

## Load data from GitHub
source("https://github.com/richarddmorey/encrypt_data_example/blob/master/data/load_data.R?raw=true")

colnames(exp1) = c("sub", "blk", "trl", "cond", "set", "stim", "resp", "acc", "rt")

## Clean up, add nice labels
exp1$stim = factor(as.integer(substr(exp1$stim,5,6)), ordered = TRUE)
exp1$resp = factor(as.integer(substr(exp1$resp,4,5)), ordered = TRUE)
exp1$sub = factor(exp1$sub)
exp1$set = factor(exp1$set)
levels(exp1$set) = c("narrow","wide")
exp1$cond = factor(exp1$cond)
levels(exp1$cond) = c("nw","ww","wn","nn")


## Accuracy by stim
aggregate(acc ~ stim, mean, data = exp1)

