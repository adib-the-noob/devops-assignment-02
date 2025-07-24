# Setting up SSH key

```bash
➜  ~ ssh-keygen -t ed25519 -C "md...0@gmail.com" -f ~/.ssh/my_droplet_key

Generating public/private ed25519 key pair.

Your identification has been saved in /home/adib/.ssh/my_droplet_key
Your public key has been saved in /home/adib/.ssh/my_droplet_key.pub

The key fingerprint is:
SHA256:........Hr4 m...0@gmail.com

The key's randomart image is:
+--[ED25519 256]--+
|              .**|
|           .**.**|
|        .**.**.**|
|        .**.**.**|
|     S c.**.**.**|
|        .**.**.**|
|        .**.**.**|
|        .**.**.**|
|        .**.**.**|
|                 |
+----[SHA256]-----+
```

```bash
➜  ~ cat /home/adib/.ssh/my_droplet_key.pub
ssh-ed25519 AAAAC3N...4+c9...j+f...SS m....50@gmail.com
```
Now, we need to add this public key to the DigitalOcean droplet.

```bash
➜  ~ ssh -i ~/.ssh/my_droplet_key adib@<vm-ip>  
```