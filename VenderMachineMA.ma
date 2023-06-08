[top]
components : zero@moorestate five@moorestate ten@moorestate fifteen@moorestate twenty@moorestate
out : zero five ten fifteen twenty error
in : in

Link : in eventIn@zero
Link : in eventIn@five
Link : in eventIn@ten
Link : in eventIn@fifteen
Link : in eventIn@twenty

Link : transitionOut@zero transitionIn@five
Link : transitionOut@zero transitionIn@ten
Link : transitionOut@five transitionIn@ten
Link : transitionOut@five transitionIn@fifteen
Link : transitionOut@ten transitionIn@fifteen
Link : transitionOut@ten transitionIn@twenty
Link : transitionOut@fifteen transitionIn@twenty
Link : transitionOut@fifteen transitionIn@zero
Link : transitionOut@twenty transitionIn@zero

Link : stateOut@zero zero
Link : errorOut@zero error
Link : stateOut@five five
Link : errorOut@five error
Link : stateOut@ten ten
Link : errorOut@ten error
Link : stateOut@fifteen fifteen
Link : errorOut@fifteen error
Link : stateOut@twenty twenty
Link : errorOut@twenty error

[zero]
StateCode : 0
StateValue : 0
NumberOfTransitions : 2
Transition01 : 0->1
Transition02 : 1->2

[five]
StateCode : 1
StateValue : 5
NumberOfTransitions : 2
Transition01 : 0->2
Transition02 : 1->3

[ten]
StateCode : 2
StateValue : 10
NumberOfTransitions : 2
Transition01 : 0->3
Transition02 : 1->4

[fifteen]
StateCode : 3
StateValue : 15
NumberOfTransitions : 3
Transition01 : 0->4
Transition02 : 1->4
Transition03 : 2->0

[twenty]
StateCode : 4
StateValue : 20
NumberOfTransitions : 1
Transition01 : 3->0

