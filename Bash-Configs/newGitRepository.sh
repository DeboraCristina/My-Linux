newrepo()
{
	if [ -d ".git" ]
	then
		echo "Already exist a repository"
	else
		git init
		git branch -M main

		echo -n "remote: "
		read link_remote
		if [ -z $link_remote ]
		then
			echo "no remote link"
		else
			git remote add origin $link_remote
			git remote
			echo "remote link added"
		fi
	fi
}
