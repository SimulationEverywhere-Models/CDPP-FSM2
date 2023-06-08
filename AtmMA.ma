[top]
components : idle@moorestate checkingpin@moorestate selectingtransaction@moorestate withdrawing@moorestate inputingamount@moorestate confirming@moorestate withdrawaldone@moorestate depositing@moorestate insertingmoney@moorestate depositdone@moorestate
out : idle checkingpin selectingtransaction withdrawing inputingamount confirming withdrawaldone depositing insertingmoney depositdone error
in : in

Link : in eventIn@idle
Link : in eventIn@checkingpin
Link : in eventIn@selectingtransaction
Link : in eventIn@withdrawing
Link : in eventIn@inputingamount
Link : in eventIn@confirming
Link : in eventIn@withdrawaldone
Link : in eventIn@depositing
Link : in eventIn@insertingmoney
Link : in eventIn@depositdone

Link : transitionOut@idle transitionIn@idle
Link : transitionOut@idle transitionIn@checkingpin
Link : transitionOut@checkingpin transitionIn@idle
Link : transitionOut@checkingpin transitionIn@selectingtransaction
Link : transitionOut@selectingtransaction transitionIn@withdrawing
Link : transitionOut@selectingtransaction transitionIn@depositing
Link : transitionOut@withdrawing transitionIn@inputingamount
Link : transitionOut@inputingamount transitionIn@confirming
Link : transitionOut@confirming transitionIn@inputingamount
Link : transitionOut@confirming transitionIn@withdrawaldone
Link : transitionOut@withdrawaldone transitionIn@idle
Link : transitionOut@depositing transitionIn@insertingmoney
Link : transitionOut@insertingmoney transitionIn@depositdone
Link : transitionOut@depositdone transitionIn@idle

Link : stateOut@idle idle
Link : errorOut@idle error
Link : stateOut@checkingpin checkingpin
Link : errorOut@checkingpin error
Link : stateOut@selectingtransaction selectingtransaction
Link : errorOut@selectingtransaction error
Link : stateOut@withdrawing withdrawing
Link : errorOut@withdrawing error
Link : stateOut@inputingamount inputingamount
Link : errorOut@inputingamount error
Link : stateOut@confirming confirming
Link : errorOut@confirming error
Link : stateOut@withdrawaldone withdrawaldone 
Link : errorOut@withdrawaldone  error
Link : stateOut@depositing depositing
Link : errorOut@depositing error
Link : stateOut@insertingmoney insertingmoney
Link : errorOut@insertingmoney error
Link : stateOut@depositdone depositdone
Link : errorOut@depositdone error



[idle]
StateCode : 0
StateValue : 0
NumberOfTransitions : 1
Transition01 : 0->1

[checkingpin]
StateCode : 1
StateValue : 1
NumberOfTransitions : 2
Transition01 : 1->0
Transition02 : 2->2

[selectingtransaction]
StateCode : 2
StateValue : 2
NumberOfTransitions : 2
Transition01 : 3->3
Transition02 : 9->7

[withdrawing]
StateCode : 3
StateValue : 3
NumberOfTransitions : 1
Transition01 : 4->4

[inputingamount]
StateCode : 4
StateValue : 4
NumberOfTransitions : 1
Transition01 : 5->5

[confirming]
StateCode : 5
StateValue : 5
NumberOfTransitions : 2
Transition01 : 6->4
Transition02 : 7->6

[withdrawaldone]
StateCode : 6
StateValue : 6
NumberOfTransitions : 1
Transition01 : 8->0

[depositing]
StateCode : 7
StateValue : 7
NumberOfTransitions : 1
Transition01 : 4->8

[insertingmoney]
StateCode : 8
StateValue : 8
NumberOfTransitions : 1
Transition01 : 10->9

[depositdone]
StateCode : 9
StateValue : 9
NumberOfTransitions : 1
Transition01 : 8->0


