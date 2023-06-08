[top]
components : s0@moorestate s1@moorestate s2@moorestate
out : s0 s1 s2 error
in : in

Link : in eventIn@s0
Link : in eventIn@s1
Link : in eventIn@s2

Link : transitionOut@s0 transitionIn@s0
Link : transitionOut@s0 transitionIn@s1
Link : transitionOut@s1 transitionIn@s0
Link : transitionOut@s1 transitionIn@s2
Link : transitionOut@s2 transitionIn@s2
Link : transitionOut@s2 transitionIn@s0

Link : stateOut@s0 s0
Link : errorOut@s0 error
Link : stateOut@s1 s1
Link : errorOut@s1 error
Link : stateOut@s2 s2
Link : errorOut@s2 error

[s0]
StateCode : 0
StateValue : 0
NumberOfTransitions : 2
Transition01 : 0->0
Transition02 : 1->1

[s1]
StateCode : 1
StateValue : 0
NumberOfTransitions : 2
Transition01 : 0->0
Transition02 : 1->2

[s2]
StateCode : 2
StateValue : 1
NumberOfTransitions : 2
Transition01 : 0->0
Transition02 : 1->2
