gitignore()
{
	if [[ $# > 0 ]]
	then
		if [[ ! -a ".gitignore" ]]
		then
			echo ".gitignore" > .gitignore
		fi
		for arg in $@
		do
			echo "$arg" >> .gitignore
		done
	fi
}
