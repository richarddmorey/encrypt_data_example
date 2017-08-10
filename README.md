# Encrypt data example
Shows how to encrypt data held in public space

The example data is from my Master's thesis. You can obtain all the details at the GitHub repository:

https://github.com/richarddmorey/absoluteJudgmentCalibration

Here, I've only used the minimum content needed for a working example.

What am I assuming?

* You would like to save data in a online repository for convenience, safety, and potential future sharing
* You would like to keep these data private for a time
* You'd like to easily share the data with colleagues/editors/reviewers, even though they are private
* You don't need heavy-duty security/encryption
* You analyze data in R

If these are true, this example is for you.

### What does this example show?

* **How to encrypt a file for sharing**: See `encrypt_it.R`, which shows how to create an encrypted file with a passphrase, which you can then share on GitHub or OSF. The file that is encrypted, `exp1.txt`, is linked in the script.
* **How to decrypt a file for analysis**: See `load_data.R` for an example data loading script that decrypts the file directly from GitHub. Note that in this file, passphrase is defined so that you can load the data. You would not share this until you were ready. This repository is in a "public-sharing-ready" state.

Once the data is loaded using the `load_data.R` script, one can analyse it as normal. For someone simply running the script with the correct passphrase, the encryption is completely transparent.

