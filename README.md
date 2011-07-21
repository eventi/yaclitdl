Yet another CLI ToDo List
=========================

Usage:
------

	now Drink Beer
	next Write a README
	later Get some sleep
	type now to see what you're supposed to be doing
	type next when you're done
	type later when you just can't bare to work on this task now

Example:
--------

Suppose you're drinking a beer, but you remember that you forgot to
remember to write the README you were supposed to do.

First, remember to get back to the beer

	$ next Drink Beer
	Now:
	Next: Drink Beer

Then note that you're supposed to be writing the README

	$ now Write README
	Now: Write README
	Next: Drink Beer

And you discover that you don't know markdown

	$ now Learn Markdown
	Now: Learn Markdown
	Next: Write README

All this learning is making you tired

	$ later get sleep
	Now: Learn Markdown
	Next: Write README

OK - so you're cool with Markdown, let's move on

	$ next
	Now: Write README
	Next: Drink Beer

You realize that you have to commit and push next

	$ next Commit and push to github
	Now: Write README
	Next: Commit and push to github

Done with the README

	$ next
	Now: Commit and push to github
	Next: Drink Beer

Time to commit - Hey, I heard about this book...

	$ later Read War and Peace
	Now: Commit and push to github
	Next: Drink Beer

Done committing and pushing

	$ next
	Now: Drink Beer
	Next: get sleep

Save the beer for another day

	$ later
	Now: get sleep
	Next: Read War and Peace

Get some rest

	$ next
	Now: Read War and Peace
	Next: Drink Beer

That doesn't seem like a good idea anymore

	$ later
	Now: Drink Beer
	Next:

I just woke up, I'll drink later... 
	
	$ later
	Now: Read War and Peace
	Next:

OK - Finished Reading War and Peace (wow)

	$ next
	Now: Drink Beer
	Next:

Done with the beer

	$ next
	Now:
	Next:
