# Disk configuration

The machine comes with an Arraid disk controller, which emulates the old HP disks (7905, 7906, 7920, or 7925). The actual type of the controller can't be found as there is no type marking on it at all.

There is an HP 13037D disk controller which is attached to the Arraid with a data cable and a control cable. The 13037D controller is described as a "MAC/ICD disc controller". The D variant supports both the MAC bus (for connecting to older HP computers via their native MAC interface cards) and ICD (Intelligent Controller Device) — which is HP's AMIGO/HP-IB protocol for connecting over IEEE-488.

The controller has probably been extended with a HP 12745A option which adds a HP-IB interface to it.

Inside the I/O card cage we have an HP 12821A disk controller card which should be connected to the HP-IB interface.

So the chain is:

2113B → 12821A (HP-IB card in I/O cage) → [HP-IB cable] → 13037C with 12745 adapter fitted → Arraid unit

To boot from these disks I need one of the following boot rom sets:

* 12992H — ICD/AMIGO loader ROM, or
* 12992J — CS/80 loader ROM





