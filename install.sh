#!/bin/bash

verbose(){
	echo Now: `cat .now`
	echo Next: `tail -1 .next`
}

now(){
	task=$*
	if [ "x" == "x$task" ] ; then
		if [ ! -e .now ] ; then
			if [ -s .next ] ; then
				tail -1 .next > .now && sed -i.bak -e '$d' .next
			else
				touch .now
			fi
		fi
	else
		[ -e .now ] && cat .now >> .next
		echo $task > .now
	fi
	verbose
}

next(){
	task=$*
	if [ "x" == "x$task" ] ; then
		[ -e .now ] && cat .now >> .done
		tail -1 .next > .now && sed -i.bak -e '$d' .next
	else
		echo $task >> .next
	fi
	now
}

later(){
	task=$*
	if [ "x" == "x$task" ]; then
		mv .now .later
		next
	else
		echo $task > .later
		now
	fi
	cat .next >> .later
	mv .later .next
}

install(){
	cp install.sh /usr/local/bin/now
	ln /usr/local/bin/now /usr/local/bin/next
	ln /usr/local/bin/now /usr/local/bin/later
	ln /usr/local/bin/now /usr/local/bin/tasks
}

tasks(){
	awk '{print "Now: "  $0}' < .now
	tail -r .next | awk '{print "Next: " $0}'
}

case `basename $0` in
	now)
		now $*
		;;
	next)
		next $*
		;;
	later)
		later $*
		;;
	tasks)
		tasks $*
		;;
	install.sh)
		install $*
		;;
esac
