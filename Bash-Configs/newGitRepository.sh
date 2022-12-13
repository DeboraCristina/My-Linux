newrepo()
{
	git init
	git branch -M main
	git remote add origin $1
	git remote
}
