[top]
components : idle@moorestate gettingnumber@moorestate ringingaside@moorestate ringingbside@moorestate speech@moorestate waitonhook@moorestate
out : idle gettingnumber ringingaside ringingbside speech waitonhook error
in : in

Link : in eventIn@idle
Link : in eventIn@gettingnumber
Link : in eventIn@ringingaside
Link : in eventIn@ringingbside
Link : in eventIn@speech
Link : in eventIn@waitonhook

Link : transitionOut@idle transitionIn@gettingnumber
Link : transitionOut@idle transitionIn@ringingbside
Link : transitionOut@gettingnumber transitionIn@idle
Link : transitionOut@gettingnumber transitionIn@ringingaside
Link : transitionOut@gettingnumber transitionIn@waitonhook
Link : transitionOut@ringingaside transitionIn@idle
Link : transitionOut@ringingaside transitionIn@speech
Link : transitionOut@ringingbside transitionIn@idle
Link : transitionOut@ringingbside transitionIn@speech
Link : transitionOut@speech transitionIn@idle
Link : transitionOut@speech transitionIn@waitonhook
Link : transitionOut@waitonhook transitionIn@idle

Link : stateOut@idle idle
Link : errorOut@idle error
Link : stateOut@gettingnumber gettingnumber
Link : errorOut@gettingnumber error
Link : stateOut@ringingaside ringingaside
Link : errorOut@ringingaside error
Link : stateOut@ringingbside ringingbside
Link : errorOut@ringingbside error
Link : stateOut@speech speech
Link : errorOut@speech error
Link : stateOut@waitonhook waitonhook
Link : errorOut@waitonhook error

[idle]
StateCode : 0
StateValue : 0
NumberOfTransitions : 2
Transition01 : 0->1
Transition02 : 5->3

[gettingnumber]
StateCode : 1
StateValue : 1
NumberOfTransitions : 3
Transition01 : 1->2
Transition02 : 4->0
Transition03 : 6->5

[ringingaside]
StateCode : 2
StateValue : 2
NumberOfTransitions : 2
Transition01 : 2->4
Transition02 : 4->0

[ringingbside]
StateCode : 3
StateValue : 3
NumberOfTransitions : 2
Transition01 : 2->4
Transition02 : 4->0

[speech]
StateCode : 4
StateValue : 4
NumberOfTransitions : 2
Transition01 : 3->5
Transition02 : 4->0

[waitonhook]
StateCode : 5
StateValue : 5
NumberOfTransitions : 1
Transition01 : 4->0

