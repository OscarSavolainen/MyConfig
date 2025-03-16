These are all dot files, (e.g. .bashrc) 

They should be symlinked to home, i.e.
```bash
ln -s /home/oscar/Coding/Mine/MyConfig/config-files/.xprofile ~/.xprofile
ln -s /home/oscar/Coding/Mine/MyConfig/config-files/.zshrc ~/.zshrc
ln -s /home/oscar/Coding/Mine/MyConfig/config-files/.bashrc ~/.bashrc
ln -s /home/oscar/Coding/Mine/MyConfig/config-files/.vimrc ~/.vimrc
```
I also have a `secrets.sh` (in `.gitignore`) where I keep a lot of env variables, e.g.
```
#!/bin/bash

export ANTHROPIC_API_KEY='sk-ant-XXX'
export HUGGINGFACE_TOKEN=hf_XXX
```
This is run by `.zshrc`

