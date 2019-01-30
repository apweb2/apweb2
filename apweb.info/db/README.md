# Setting up this xataface application

```
git clone https://github.com/apweb2/apweb2.git
cd apweb2/apweb.info/db
htpasswd -c .pw apweb2 # enter a password
curl -L -O https://github.com/shannah/xataface/archive/2.2.2.tar.gz
tar xvzf 2.2.2.tar.gz
mv xataface-2.2.2/ xataface
rm 2.2.2.tar.gz
mkdir templates_c # readable by the server. On DH just needs user write perms.
cp conf.template.ini conf.ini
emacs conf.ini  # Add the DB password
rm conf.ini~
```

