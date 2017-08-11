## Source locally when developing and key is not shared
# source("load_data.R")

## Source from GitHub after key is shared
source("https://github.com/richarddmorey/encrypt_data_example/blob/master/data/load_data.R?raw=true")
## Source from OSF after key is shared
# source("https://osf.io/73thx/download?version=2")

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

