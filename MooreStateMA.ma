[top]
components : moorestate@MooreState
out : stateOut
out : transitionOut
out : errorOut
in : transitionIn
in : eventIn
Link : eventIn eventIn@moorestate
Link : transitionIn transitionIn@moorestate
Link : stateOut@moorestate stateOut
Link : transitionOut@moorestate transitionOut
Link : errorOut@moorestate errorOut
Link : transitionOut@moorestate transitionIn@moorestate

[moorestate]
StateCode : 0
StateValue : 1
NumberOfTransitions : 2
Transition01 : 0->1
Transition02 : 1->0

