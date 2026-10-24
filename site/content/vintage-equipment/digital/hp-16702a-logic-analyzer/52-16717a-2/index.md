# The second HP 16717A board

Let's hope we can repair this one too ;) The initial state reported the following errors:

![The initial set of test failures](pv-2-initial-1.png)

This looks better than the first card, actually.

## cmpTest

The cmpTest failure, with details:

![The cmpTest failures](pv-2-cmpTest-1.png)

Slot Chip 8 (U22) two bad bits: 0 and 13. It was in this area:

![Comparator traces to "Chip 8"](pv-2-comp-traces-1.png)

## vramSerDataTest

![vramSerDataTest failures](pv-2-vramser-1.png)

This one was easy too: just two traces between the RAMs and U22. After that the board also passes all tests. Easy peasy ;)
