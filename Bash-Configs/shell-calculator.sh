mod()
{
	if [ -z $1 -o -z $2 ]
	then
		echo "ERROR"
		return 1
	fi
	a=$1
	b=$2
	declare -i c
	c=$a%$b
	echo "$c"
}

soma()
{
	if [ -z $1 -o -z $2 ]
	then
		echo "ERROR"
		return 1
	fi
	a=$1
	b=$2
	declare -i c
	c=$a+$b
	echo "$c"
}

sub()
{
	if [ -z $1 -o -z $2 ]
	then
		echo "ERROR"
		return 1
	fi
	a=$1
	b=$2
	declare -i c
	c=$a-$b
	echo "$c"
}

mul()
{
	if [ -z $1 -o -z $2 ]
	then
		echo "ERROR"
		return 1
	fi
	a=$1
	b=$2
	declare -i c
	c=$a*$b
	echo "$c"
}

div()
{
	if [ -z $1 -o -z $2 ]
	then
		echo "ERROR"
		return 1
	fi
	a=$1
	b=$2
	declare -i c
	c=$a/$b
	echo "$c"
}

len()
{
	local="$(pwd)/len.py"
	python3 $local $1
}
