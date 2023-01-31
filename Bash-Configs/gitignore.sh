gitignore()
{
	if [[ $# > 0 ]]
	then
		if [[ ! -a ".gitignore" ]]
		then
			echo ".gitignore" > .gitignore
			echo ".gitignore created!"
		fi
		for arg in $@
		do
			echo "$arg" >> .gitignore
			echo "\"$arg\" added to .gitignore"
		done
	else
		echo "please input arguments"
	fi
}
