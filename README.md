# pstreecim.ps1

Powershell script to print a flat process tree.

I.e., prints a list of all running processes, grouped by their parent process IDs.

When able, the script will determine the identity of the parent process, but if the parent has already exited it will show only the id and list it as \<Unknown\>

Copyright (c) 2024, userhwon
