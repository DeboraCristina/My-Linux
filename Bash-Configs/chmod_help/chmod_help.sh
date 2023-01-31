chmod_help()
{
	if [[ "$1" == "-h" || "$1" == "--help" ]]
	then
		python3 $myBashConfigsPath/chmod_help/utils/help_message.py
	else
		python3 $myBashConfigsPath/chmod_help/main.py $@
	fi
}
