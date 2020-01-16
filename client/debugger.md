# Prologue

The deubbger listens on port 6110, then launches the program, the first client that connects stops listening and manages this as the program to be debugged.
at this point they begin to exchange packets, they have an asymmetrical shape, * to be changed *.
Those from the -> program debugger have the form COMMAND: PARAM1: PARAM2: PARAM3 ... \ r \ n.
Those from the <- program to the debugger have the form COMMAND \ r \ nPARAM1 \ r \ nPARAM2 \ r \ n.

## GO ->
Tells the program to continue execution

## NEXT ->
Tells the program to execute the next instruction

## STEP ->
Tells the program to execute the next statement at the same level

## EXIT ->
Tells the program to exit the current metoo

## PAUSE ->
Tells the program to stop execution at the first *** instruction compiled with the debug symbols ***.

## STOP <-
Indicates that the program has stopped. is followed by a textual description of why it stopped, for example "Break" because it found a breakpoint, "Pause" because the PAUSE command was processed, etc ...

## ERROR <-
Indicates that the program has stopped due to an error

## INERROR ->
Asks if you are in error, the program returns T if you are in error. *** Needless ***

## BREAKPOINT ->
Indicates that I am about to send a break point. the second line has the list of parameters separated by: a colon.
 * \ + for breapoints to be added, - for breaches to be removed
 * the name of the file
 * the line
 * optionally? followed by (separated by a colon) a command in harbor from esegure where i: are replaced by;. The breakpoint is triggered only if the condition is true.
 * optionally C followed by (separated by a colon) a number to indicate after how many times the breakpoint will start
 * optionally L followed by (separated by a colon) a string where the parts in braces are performed (*** to be changed ***)

## LOG <-
Requires printing a debug string, which follows the "LOG:"

## LOCALS, PUBLICS, PRIVATES, PRIVATE_CALLEE, STATICS ->
Requires the list of variables for the purpose indicated by the command. the second line has the list of parameters separated by: a colon.
 * the stack level
 * the index of the first element to return, starting from 1
 * the number of elements to return, 0 to have them all.
the program will reply with a message that starts with the same command, followed by the information separated by 2 points:
 * the first part of the command to have children of this variable, 3 letters
 * the libellus of the stack
 * the id of this variable (numeric)
 * the id name of this variable
 * the name

## EXPRESSION ->
Requires execution of a command. the second line has the list of parameters separated by: a colon.
 * the level on the stack
 * the expression where i: are replaced by;
For each of these commands the debugger will respond with a message that begins with ** EXPRESSION ** followed by the information separated by 2 points:
 * the stack level
 * the type of the result can be U, N, C, L, A, H, O etc ...
 * the result to show, in the case of N, C, L or the number of children in the case of A, H, O