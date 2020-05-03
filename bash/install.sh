#add bash aliases
cp $(dirname $0)/.bash_aliases ~/.bash_aliases
#always enable colors
sed -i s/#force_color_prompt/force_color_prompt/ ~/.bashrc
#make bash autocompletion case insensitive
echo set completion-ignore-case on >> ~/.inputrc
