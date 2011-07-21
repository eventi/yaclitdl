#!/bin/bash

#usage:
# 	now - Show the current task
# 	now "A task description" - Interrupt the current task with a new task
#   next - Move on to the next task
# 	next "A task description" - Assign a task to do when you finish the current task
# 	later - Defer the current task till later
# 	later "A task description" - Assign a task to do later
# 	tasks

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
	cat .now
}

next(){
	task=$*
	if [ "x" == "x$task" ] ; then
#TODO - Save done
		cat .now >> .done
		tail -1 .next > .now && sed -i.bak -e '$d' .next
		now
	else
		echo $task >> .next
	fi
}

later(){
	task=$*
	if [ "x" == "x$task" ]; then
		now > .later
		next
	else
		echo $task > .later
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
